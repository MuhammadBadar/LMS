import { ManageCourseDetailComponent } from './manage-course-detail/manage-course-detail.component';
import { ManageInquiryComponent } from './manage-inquiry/manage-inquiry.component';
import { ScheduleListComponent } from './Schedule/schedule-list/schedule-list.component';
import { ManageScheduleComponent } from './Schedule/manage-schedule/manage-schedule.component';
import { ManageCourseComponent } from './manage-course/manage-course.component';
import { ManageUserComponent } from './manage-user/manage-user.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ManageTopicComponent } from './manage-topic/manage-topic.component';

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
  ]
},];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LMSRoutingModule { }
