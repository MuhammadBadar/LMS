import { Component, Injector, OnInit, ViewChild } from '@angular/core';
import { LectureVM } from '../Models/LectureVM';
import { LMSService } from '../lms.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MAT_DIALOG_DATA, MatDialog, MatDialogRef } from '@angular/material/dialog';
import { ManageCourseComponent } from '../manage-course/manage-course.component';
import { CourseVM } from '../Models/CourseVM';
import { TopicVM } from '../Models/TopicVM';
import { ManageTopicComponent } from '../manage-topic/manage-topic.component';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-lecture',
  templateUrl: './manage-lecture.component.html',
  styleUrls: ['./manage-lecture.component.css']
})
export class ManageLectureComponent implements OnInit {
  displayedColumns: string[] = ['course', 'topic', 'title', 'url', 'description', 'isActive', 'actions'];
  AddMode: boolean = true
  proccessing: boolean = false;
  EditMode: boolean = false
  values?: TopicVM[];
  DisabledType: boolean = false;
  dataSource: any
  selectedlec: LectureVM
  lecs?: LectureVM[]
  @ViewChild('lectureForm', { static: true }) lectureForm: NgForm;
  courses?: CourseVM[]
  topics?: TopicVM[]
  Edit: boolean = false;
  dialogRef: any
  dialogref: any
  dialogData: any;
  isDialog: boolean = false;
  isActive?: false
  Add: boolean = true;
  hide = true;
  constructor(
    private injector: Injector,
    private lmsSvc: LMSService,
    private catSvc: CatalogService,
    private dialog: MatDialog) {
    this.dialogref = this.injector.get(MatDialogRef, null);
    this.dialogData = this.injector.get(MAT_DIALOG_DATA, null);
    this.selectedlec = new LectureVM();
  }
  ngOnInit(): void {
    this.GetLecture()
    this.GetTopic()
    this.GetCourses()
    this.Add = true;
    this.selectedlec.isActive = true;
    this.isDialog = this.dialogData.isDialog;

  }
  GetCourses() {
    var course = new CourseVM
    course.isActive = true;
    this.selectedlec.isActive = true;
    this.lmsSvc.SearchCourse(course).subscribe({
      next: (res: CourseVM[]) => {
        this.courses = res
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetTopic() {
    var topic = new TopicVM
    topic.isActive = true;
    this.selectedlec.isActive = true;
    this.lmsSvc.SearchTopic(topic).subscribe({
      next: (value: TopicVM[]) => {
        this.topics = value
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetLecture() {
    this.lmsSvc.GetLecture().subscribe({
      next: (value: LectureVM[]) => {
        this.lecs = value
        this.dataSource = new MatTableDataSource(this.lecs)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(err)
      },

    })
  }
  SaveLecture() {
    if (this.selectedlec.courseId == 0 || this.selectedlec.courseId == undefined) {
      this.lectureForm.controls['Course'].setErrors({ 'incorrect': true });
      console.warn(this.lectureForm);
    }
    if (this.selectedlec.topicId == 0 || this.selectedlec.topicId == undefined) {
      this.lectureForm.controls['Topic'].setErrors({ 'incorrect': true });
      console.warn(this.lectureForm);
    }
    this.lmsSvc.GetLecture().subscribe({
      next: (res: LectureVM[]) => {
        var list = res;
        if (this.Edit) {
          res = res.filter(x => x !== this.selectedlec);
        }
        var find = res.find(x => x.title === this.selectedlec.title);
        if (find == undefined) {
          const controls = this.lectureForm.controls;
          if (this.lectureForm.invalid) {
            for (const name in controls) {

               if (controls[name].hasError('required')) {
                this.catSvc.ErrorMsgBar(` ${name} is required field`, 6000)
                 break
               }else if(controls[name].hasError('minlength')){
        
                 this.catSvc.ErrorMsgBar(` ${name} must be atleast ${controls[name].errors['minlength'].requiredLength } characters long.`, 6000)
                 break
            }}
          } else {
            this.proccessing = true;
            if (this.EditMode) {
              this.UpdateLecture();
            } else {
              this.lmsSvc.SaveLecture(this.selectedlec).subscribe({
                next: (res) => {
                  this.catSvc.SuccessMsgBar("Successfully Added!", 6000);
                  this.ngOnInit();
                  this.Refresh();
                  window.scrollTo(0, 0);
                  this.proccessing = false;
                },
                error: (e) => {
                  console.warn(e);
                  this.catSvc.ErrorMsgBar("Error Occurred!", 6000);
                  this.proccessing = false;
                }
              });
            }
          }
        } else {
          this.catSvc.ErrorMsgBar("This Title Already Taken ", 5000);
        }
      },
      error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
        console.warn(e);
      }
    });


  }
  EditLecture(lect: LectureVM) {
    this.EditMode = true
    this.AddMode = false
    this.selectedlec = lect
    this.selectedlec.isActive = true;
  }
  UpdateLecture() {
    this.proccessing = true;

    if (this.lectureForm && !this.lectureForm.invalid && this.selectedlec) {
      this.lmsSvc.UpdateLecture(this.selectedlec).subscribe({
        next: (value) => {
          this.catSvc.SuccessMsgBar("Successfully Updated", 5000);
          this.Add = true;
          this.Edit = false;
          this.proccessing = false;
          this.ngOnInit();
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000);
          console.warn(err);
          this.proccessing = false;
        }
      });
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000);
      this.proccessing = false;
    }
  }

  Refresh() {
    this.GetLecture();
    this.selectedlec = new LectureVM
    this.selectedlec.isActive = true;
    this.GetCourses();
    this.GetTopic();
    this.Add = true;
    this.Edit = false;
  }
  DeleteLecture(id: number) {
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
        this.lmsSvc.DeleteLecture(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Topic has been deleted.',
              'success'
            )
            this.Refresh();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  OpenCourseDialog() {
    const dialogRef = this.dialog.open(ManageCourseComponent, {
      width: '1200px',
      height: '950px',
      data: { isDialog: true }
    });

    dialogRef.afterClosed().subscribe(() => {
      this.GetCourses();
    });
  }


  OpenTopicDialog() {
    this.dialogRef = this.dialog.open(ManageTopicComponent, {
      width: '1200px', height: '950px'
      , data: { isDialog: true, courseId: this.selectedlec.courseId }

    })
    console.warn(this.selectedlec.courseId)
    this.dialogRef.afterClosed()
      .subscribe((res: any) => {
        this.GetTopic()
      }
      );
  }
    Search() {
      var topic = new TopicVM();
      topic.courseId = this.selectedlec.courseId;
      topic.isActive = true;
      this.lmsSvc.SearchTopic(topic).subscribe({
        next: (value: TopicVM[]) => {
          this.topics = value
        }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
      var lec = new LectureVM();
      lec.courseId = this.selectedlec.courseId;
      this.lmsSvc.SearchLecture(lec).subscribe({
        next: (value: LectureVM[]) => {
          this.lecs = value
          this.dataSource = new MatTableDataSource(this.lecs)
        }, error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
    }
  validateNo(e: any): boolean {
    const charCode = e.which ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false
    }
    return true
  }
}