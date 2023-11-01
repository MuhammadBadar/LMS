import { ManageCourseDetailComponent } from './manage-course-detail/manage-course-detail.component';
import { ManageInquiryComponent } from './manage-inquiry/manage-inquiry.component';

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

import { ManageAssignTaskComponent } from './manage-assign-task/manage-assign-task.component';
import { ManagePatientComponent } from './manage-patient/manage-patient.component';


import { ManageUserattbydateComponent } from './manage-userattbydate/manage-userattbydate.component';
import { ManageTasksComponent } from './manage-tasks/manage-tasks.component';
import { ManageUserreportComponent } from './manage-userreport/manage-userreport.component';
import { ManageUsertaskbydateComponent } from './manage-usertaskbydate/manage-usertaskbydate.component';

import { ManageUsertaskComponent } from './manage-usertask/manage-usertask.component';
import { ManageClientComponent } from './manage-client/manage-client.component';
import { ManageDayStatusComponent } from './manage-day-status/manage-day-status.component';

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
      path: "course",
      component: ManageCourseComponent,
      pathMatch: "full"
    },

    {
      path: "usertask",
      component: ManageUsertaskComponent,
      pathMatch: "full"
    },
    {
      path: "daystatus",
      component: ManageDayStatusComponent,
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
      path: "Patient",
      component: ManagePatientComponent,
      pathMatch: "full"
    },
    {
      path: "Client",
      component: ManageClientComponent,
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
