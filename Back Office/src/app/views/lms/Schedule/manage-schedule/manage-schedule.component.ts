
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute } from '@angular/router';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { ItemsService } from 'src/app/views/items/items.service';
import { SettingsVM } from 'src/app/views/items/Models/SettingsVM';
import { EnumTypeVM } from 'src/app/views/security/models/EnumTypeVM';
import Swal from 'sweetalert2';

import { Location } from '@angular/common';
import * as moment from 'moment';
import { ClassTimingVM, ScheduleVM } from '../../Models/ScheduleVM';
import { LMSService } from '../../lms.service';
import { CourseVM } from '../../Models/CourseVM';

@Component({
  selector: 'app-manage-schedule',
  templateUrl: './manage-schedule.component.html',
  styleUrls: ['./manage-schedule.component.css']
})
export class ManageScheduleComponent implements OnInit {
  exportTime = { hour: 7, minute: 15, meriden: 'PM', format: 12 };

  previewImage = false;
  currentLightBoxImage: any
  addButton = true
  proccessing: boolean = false;
  lineAddMode: boolean = false
  lineEditMode: boolean = true
  Edit: boolean = false;
  Add: boolean = true;
  Courses?: CourseVM[]
  WeekDays?: SettingsVM[]
  ScheduleId!: number
  getSchById!: ScheduleVM[];
  Schedules: ScheduleVM[] = []
  selectedSchedule = new ScheduleVM
  selectedClassTiming = new ClassTimingVM
  selectedDetail = new ClassTimingVM
  ClassTimings: ClassTimingVM[] = []
  @ViewChild('ScheduleForm', { static: true }) ScheduleForm!: NgForm;
  @ViewChild('ClassTimingForm', { static: true }) ClassTimingForm!: NgForm;
  displayeScheduleColumns: string[] = ['day', 'timeFrom', 'timeTo', 'actions'];
  dataSource: any
  outputArray = [];
  constructor(
    public lmsSvc: LMSService,
    private route: ActivatedRoute,
    private _location: Location,
    public catSvc: CatalogService,
    private itmSvc: ItemsService) {
    this.selectedSchedule = new ScheduleVM();
    this.selectedClassTiming = new ClassTimingVM()

  }
  ngOnInit(): void {
    this.selectedSchedule = new ScheduleVM();
    this.selectedClassTiming = new ClassTimingVM()
    this.ClassTimings = []
    this.route.queryParams.subscribe(params => {
      this.ScheduleId = params['id'];
    });
    if (this.ScheduleId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetScheduleById();
    }
    else {
      this.Add = true;
      this.Edit = false;
      this.dataSource = new MatTableDataSource(this.ClassTimings);
    }
    this.lineAddMode = false;
    this.lineEditMode = false;

    this.GetWeekDays();
    this.GetCourses()
  }
  async GetSchedule() {
    this.lmsSvc.GetSchedule().subscribe({
      next: (res: ScheduleVM[]) => {
        this.Schedules = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  GetWeekDays() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.WeekDays
    this.itmSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.WeekDays = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  GetCourses() {
    this.lmsSvc.GetCourse().subscribe({
      next: (res: CourseVM[]) => {
        this.Courses = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  GetScheduleById() {
    debugger
    this.lmsSvc.GetScheduleById(this.ScheduleId).subscribe({
      next: (res: ScheduleVM[]) => {
        debugger
        this.getSchById = res;
        this.selectedSchedule = this.getSchById[0]
        this.ClassTimings = []
        this.selectedSchedule.classTimings?.forEach(element => {
          this.ClassTimings.push(element)
        });
        this.dataSource = new MatTableDataSource(this.ClassTimings);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
  }
  RefreshDetail() {
    this.lineAddMode = false;
    this.addButton = true
    this.lineEditMode = false;
    this.selectedClassTiming = new ClassTimingVM
    if (this.ScheduleId > 0)
      this.GetScheduleById()
  }
  Back() {
    this._location.back();
  }
  async Submit() {
    this.SetDates()
    this.selectedSchedule.classTimings = this.ClassTimings
    this.proccessing = true
    this.CheckSchValidation()
    if (!this.ScheduleForm.invalid) {
      debugger
      if (this.selectedSchedule.classTimings.length == 0)
        this.catSvc.ErrorMsgBar("Please Add some Schedule Detail!", 5000)
      else
        await this.UpdateSchedule();
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
    this.proccessing = false
  }
  SaveSchedule() {
    this.lmsSvc.SaveSchedule(this.selectedSchedule).subscribe({
      next: (res: ScheduleVM) => {
        this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
        this.selectedSchedule = res
        this.ClassTimings = []
        this.selectedSchedule.classTimings?.forEach(element => {
          this.ClassTimings.push(element)
        });
        this.dataSource = new MatTableDataSource(this.ClassTimings);
        console.warn(this.ClassTimings)
        this.RefreshDetail()
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.ClassTimings = []
        this.proccessing = false
      }
    })
  }
  UpdateSchedule() {
    this.lmsSvc.UpdateSchedule(this.selectedSchedule).subscribe({
      next: (res: ScheduleVM) => {
        if (this.Edit) {
          if (this.lineEditMode)
            this.catSvc.SuccessfullyUpdateMsg();
          else if (this.lineAddMode)
            this.catSvc.SuccessfullyAddMsg();
          else
            this.catSvc.SuccessfullyUpdateMsg();
        } else {
          if (this.lineEditMode)
            this.catSvc.SuccessfullyUpdateMsg();
          else
            this.catSvc.SuccessfullyAddMsg();
        }
        this.selectedSchedule = res
        this.ClassTimings = []
        this.selectedSchedule.classTimings?.forEach(element => {
          this.ClassTimings.push(element)
        });
        this.dataSource = new MatTableDataSource(this.ClassTimings);
        this.RefreshDetail()
        this.proccessing = false
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.ClassTimings = []
        this.proccessing = false
      }
    })
  }
  edit(ScheduleDet: ClassTimingVM) {
    this.lineEditMode = true
    this.lineAddMode = false
    this.addButton = false
    this.selectedClassTiming = ScheduleDet
    this.selectedDetail = ScheduleDet
    this.selectedClassTiming.editMode = true
  }
  delete(ScheduleDet: ClassTimingVM) {
    if (this.ClassTimings.length == 1) {
      this.catSvc.ErrorMsgBar("You Can't delete it,as Schedule has only one line ,and the Schedule Detail Can't be Empty", 9000)
    } else {
      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.value) {

          if (ScheduleDet.id == undefined || ScheduleDet.id == 0) {
            Swal.fire(
              'Deleted!',
              'Successfully Deleted.',
              'success'
            )
          } else {
            var Schedule = new ScheduleVM
            Schedule = this.selectedSchedule
            Schedule.classTimings = []
            Schedule.classTimings.push(ScheduleDet)
            ScheduleDet.dBoperation = 3
            this.lmsSvc.UpdateSchedule(Schedule).subscribe({
              next: (data: ScheduleVM) => {
                Swal.fire(
                  'Deleted!',
                  'Successfully Deleted.',
                  'success'
                )
                this.ClassTimings = []
                data.classTimings?.forEach(element => {
                  this.ClassTimings.push(element)
                });
                this.dataSource = new MatTableDataSource(this.ClassTimings);
              }, error: (e) => {
                this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
                console.warn(e);
              }
            })
          }
        }
      })
    }
  }
  async AddClassTimingtoList() {
    // this.lmsSvc.GetSchedule().subscribe({
    //   next: async (res: ScheduleVM[]) => {
    //     this.Schedules = res;
    //     var sch = this.Schedules
    //     if (this.ScheduleId > 0)
    //       sch = sch.filter(x => x.id != this.selectedSchedule.id)
    //     var searched = sch.find(x => x.courseId == this.selectedSchedule.courseId)
    //     if (searched == undefined) {
    var list = this.ClassTimings
    if (this.selectedClassTiming.id > 0)
      list = list.filter(x => x.id != this.selectedClassTiming.id)
    var find = list.find(x => x.weekDayId == this.selectedClassTiming.weekDayId)
    if (find == undefined) {
      if (this.selectedSchedule.logoBase64Path == undefined || this.selectedSchedule.logoBase64Path == null)
        this.catSvc.ErrorMsgBar("Please browse a Logo to continue", 5000)
      else {
        this.CheckSchValidation()
        if (!this.ScheduleForm.invalid) {
          if (this.selectedClassTiming.weekDayId == 0 || this.selectedClassTiming.weekDayId == undefined)
            this.ClassTimingForm.form.controls['weekDayId'].setErrors({ 'incorrect': true });
          if (!this.ClassTimingForm.invalid) {
            if (this.lineEditMode)
              this.selectedClassTiming.dBoperation = 2
            else
              this.selectedClassTiming.dBoperation = 1
            if (this.selectedClassTiming.dBoperation == 1) {
              this.lineAddMode = true
            }
            this.ClassTimings.push(this.selectedClassTiming)
            this.selectedSchedule.classTimings = []
            this.selectedSchedule.classTimings?.push(this.selectedClassTiming)

            if (this.selectedSchedule?.id > 0)
              await this.UpdateSchedule();
            else
              await this.SaveSchedule();
          }

          else {
            this.catSvc.ErrorMsgBar("Please fill all required fields of Class Timing ", 5000)
          }
        } else {
          this.catSvc.ErrorMsgBar("Please fill all required fields of Schedule", 5000)
        }
      }
    }
    else
      this.catSvc.ErrorMsgBar("Timing againts this day already added", 5000)
    //}
    // else
    //   this.catSvc.ErrorMsgBar("Schedule againts this Course already added", 5000)
    //   }, error: (e) => {
    //     this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
    //     console.warn(e);
    //   }
    // })

  }
  async onBlur() {
    // this.lmsSvc.GetSchedule().subscribe({
    //   next: async (res: ScheduleVM[]) => {
    //     this.Schedules = res;
    //     var sch = this.Schedules
    //     console.warn(sch)
    //     if (this.ScheduleId > 0)
    //       sch = sch.filter(x => x.id != this.selectedSchedule.id)
    //     var searched = sch.find(x => x.courseId == this.selectedSchedule.courseId)
    //     if (searched == undefined) {
    console.warn(this.selectedSchedule.id)
    if (this.selectedSchedule.id > 0) {
      if (!this.ScheduleForm.invalid) {
        this.SetDates()
        this.lmsSvc.UpdateSchedule(this.selectedSchedule).subscribe({
          next: (res: ScheduleVM) => {
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
            this.proccessing = false
          }
        })
      } else {
        this.catSvc.ErrorMsgBar("Please fill all required fields", 5000)
      }
    }
    //     }
    //     else
    //       this.catSvc.ErrorMsgBar("Schedule againts this Course already added", 5000)
    //   }, error: (e) => {
    //     this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
    //     console.warn(e);
    //   }
    // })
  }
  CheckSchValidation() {
    if (this.selectedSchedule.courseId == 0 || this.selectedSchedule.courseId == undefined)
      this.ScheduleForm.form.controls['courseId'].setErrors({ 'incorrect': true });
  }
  SetDates() {
    this.selectedSchedule.orientationClass = moment(this.selectedSchedule.orientationClass).toDate()
    this.selectedSchedule.orientationClass = new Date(Date.UTC(this.selectedSchedule.orientationClass.getFullYear(), this.selectedSchedule.orientationClass.getMonth(), this.selectedSchedule.orientationClass.getDate(), this.selectedSchedule.orientationClass.getHours(), this.selectedSchedule.orientationClass.getMinutes()))

    this.selectedSchedule.startDate = moment(this.selectedSchedule.startDate).toDate()
    this.selectedSchedule.startDate = new Date(Date.UTC(this.selectedSchedule.startDate.getFullYear(), this.selectedSchedule.startDate.getMonth(), this.selectedSchedule.startDate.getDate()))

  }
  handleFileInput(e: any) {
    debugger
    for (let index = 0; index < e.target.files.length; index++) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[index]);

      reader.onload = (event: any) => {
        this.selectedSchedule.logoBase64Path = event.target.result
      };
    }
    this.onBlur()
  }
  onPreviewImage(): void {
    this.previewImage = true
    this.currentLightBoxImage = this.selectedSchedule.logoBase64Path
  }
  onClosePreview() {
    this.previewImage = false;
  }
  CheckCourse(): boolean {
    var retVal = false
    this.lmsSvc.GetCourse().subscribe({
      next: (res: CourseVM[]) => {
        this.Courses = res;
        var sch = this.Schedules
        console.warn(sch)
        if (this.ScheduleId > 0)
          sch = sch.filter(x => x.id != this.selectedSchedule.id)
        var searched = sch.find(x => x.courseId == this.selectedSchedule.courseId)
        if (searched == undefined)
          retVal = false
        else
          retVal = true

      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
    return retVal;
  }
}
