import { ManageCourseDetailComponent } from './manage-course-detail/manage-course-detail.component';
import { ManageInquiryComponent } from './manage-inquiry/manage-inquiry.component';
import { ScheduleListComponent } from './Schedule/schedule-list/schedule-list.component';
import { ManageScheduleComponent } from './Schedule/manage-schedule/manage-schedule.component';
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
import { ManageScheduleFHComponent } from './manage-schedule-fh/manage-schedule-fh.component';
import { ManageAssignTaskComponent } from './manage-assign-task/manage-assign-task.component';

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
      path: "schedule",
      component: ManageScheduleComponent,
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
      path: "ScheduleFH",
      component: ManageScheduleFHComponent,
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
