import { ManageUseraccountComponent } from './../security/manage-useraccount/manage-useraccount.component';
import { ManagePatientComponent } from './manage-patient/manage-patient.component';
import { ManageCourseDetailComponent } from './manage-course-detail/manage-course-detail.component';
import { ManageInquiryComponent } from './manage-inquiry/manage-inquiry.component';
import { ScheduleListComponent } from './Schedule/schedule-list/schedule-list.component';
import { ManageCoursescheduleComponent } from './Schedule/manage-courseschedule/manage-courseschedule.component';
import { ManageCourseComponent } from './manage-course/manage-course.component';
import { ManageUserComponent } from './manage-user/manage-user.component';

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ManageTopicComponent } from './manage-topic/manage-topic.component';
import { ManageLectureComponent } from './manage-lecture/manage-lecture.component';
import { ManageCityComponent } from './manage-city/manage-city.component';
import { ManageVocabularyComponent } from './manage-vocabulary/manage-vocabulary.component';

import { ManageCityStudentComponent } from './manage-city-student/manage-city-student.component';
import { ManageStudentComponent } from './manage-student/manage-student.component';
import { ManageScheduleComponent } from './manage-schedule/manage-schedule.component';
import { ManageAssignTaskComponent } from './manage-assign-task/manage-assign-task.component';
import { ManageAttendanceComponent } from './manage-attendance/manage-attendance.component';
import { ManageUserattbydateComponent } from './manage-userattbydate/manage-userattbydate.component';
import { ManageTasksComponent } from './manage-tasks/manage-tasks.component';
import { ManageUserreportComponent } from './manage-userreport/manage-userreport.component';
import { ManageUsertaskbydateComponent } from './manage-usertaskbydate/manage-usertaskbydate.component';

const routes: Routes = [{
  path: '',
  data: {
    title: 'Items'
  },
  children: [
    {
      path: '',
      pathMatch: 'full',
      redirectTo: 'user'
    },
    {
      path: "user",
      component: ManageUserComponent,
      pathMatch: "full"
    },
    {
      path: "useraccount",
      component: ManageUseraccountComponent,
      pathMatch: "full"
    },
    {
      path: "course",
      component: ManageCourseComponent,
      pathMatch: "full"
    },
    {
      path: "schedule",
      component: ManageCoursescheduleComponent,
      pathMatch: "full"
    },
    {
      path: "schList",
      component: ScheduleListComponent,
      pathMatch: "full"
    },
    {
      path: "inquiry",
      component: ManageInquiryComponent,
      pathMatch: "full"
    },
    {
      path: "courseDetail",
      component: ManageCourseDetailComponent,
      pathMatch: "full"
    },
    {
      path: "topic",
      component: ManageTopicComponent,
      pathMatch: "full"
    },
    {
      path: "lecture",
      component: ManageLectureComponent,
      pathMatch: "full"
    }, 
    {
      path: "assignTask",
      component: ManageAssignTaskComponent,
      pathMatch: "full"
    },
   
    {
      path: "Vocabulary",
      component: ManageVocabularyComponent,
      pathMatch: "full"
    },
    {
      path: "patient",
      component: ManagePatientComponent,
      pathMatch: "full"
    },
    {
      path: "City",
      component: ManageCityComponent,
      pathMatch: "full"
    },
   
    {
      path: "CityStudent",
      component: ManageCityStudentComponent,
      pathMatch: "full"
    },
    {
      path: "Student",
      component: ManageStudentComponent,
      pathMatch: "full"
    },
    {
      path: "Schedule",
      component: ManageScheduleComponent,
      pathMatch: "full"
    },
    {
      path: "Attendance",
      component: ManageAttendanceComponent,
      pathMatch: "full"
    },

    {
      path: "Userattbydate",
      component: ManageUserattbydateComponent,
      pathMatch: "full"
    },

    {
      path: "Tasks",
      component: ManageTasksComponent,
      pathMatch: "full"
    },

    {
      path: "Usertaskbydate",
      component: ManageUsertaskbydateComponent,
      pathMatch: "full"
    },
    {
      path: "Userreport",
      component: ManageUserreportComponent,
      pathMatch: "full"
    },
  ]
  
},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LMSRoutingModule { }
