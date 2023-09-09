import { Component, OnInit, Pipe } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { LMSService } from '../lms.service';
import { LoginComponent } from '../login/login.component';
import { StudentLectureVM } from '../models/assignlectureVM';
import { ActivatedRoute } from '@angular/router';
import Swal from 'sweetalert2';
import { StudentRegistrationVM } from '../models/studentregistrationVM';
@Component({
  selector: 'app-student-lectures',
  templateUrl: './student-lectures.component.html',
  styleUrls: ['./student-lectures.component.css']
})
export class StudentLecturesComponent implements OnInit {
  stdlec: StudentLectureVM[];
  student: StudentRegistrationVM[];
  name;
  password;
  dataSource;
  displayedColumns = ['student', 'title', 'lecture', 'description', 'assignedOn'];
  constructor(
    private route: ActivatedRoute,
    public lmssvc: LMSService,
    public login: LoginComponent
  ) {
    this.lmssvc.selectedStudentLecture = new StudentLectureVM;
    this.lmssvc.selectedRegisterStudent = new StudentRegistrationVM;
  }
  ngOnInit(): void {
    this.lmssvc.selectedStudentLecture.userName = localStorage.getItem('LMSUserName')
    this.Search();
    // this.route.queryParams.subscribe(params => {
    //   this.lmssvc.selectedStudentLecture.password=params.password;
    //   this.lmssvc.selectedStudentLecture.userName = params.userName;
    //  });
  }
  Search() {
    this.lmssvc.SearchStudentLecture(this.lmssvc.selectedStudentLecture).subscribe((res: StudentLectureVM[]) => {
      this.stdlec = res;
      if (this.stdlec.length == 0) {
        Swal.fire({
          position: 'center',
          title: this.lmssvc.selectedStudentLecture.userName + ' No Lecture Assigned to you yet',
          background: "#FFFFFF",
          confirmButtonColor: "#000000"
        })
      }
      this.dataSource = new MatTableDataSource(this.stdlec);
    });
  }
}
