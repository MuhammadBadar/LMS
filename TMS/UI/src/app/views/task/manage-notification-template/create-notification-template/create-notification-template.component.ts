import { TaskService } from './../../task.service';
import { Component, OnInit } from '@angular/core';
import { NotificationTemplateVM } from '../../models/NotificationTemplateVM';
import { ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-create-notification-template',
  templateUrl: './create-notification-template.component.html',
  styleUrls: ['./create-notification-template.component.css']
})
export class CreateNotificationTemplateComponent implements OnInit {
  Add: boolean = true;
  Edit: boolean = false;
  template: NotificationTemplateVM[]
  temId: number
  constructor(
    private route: ActivatedRoute,
    private snack: MatSnackBar,
    public taskSvc: TaskService
  ) {
    this.taskSvc.selectedTemplateData = new NotificationTemplateVM
  }
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.temId = params.id;
    });
    if (this.temId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetTemplateById();
    }
  }
  PutTemplate() {
    console.warn(this.taskSvc.selectedTemplateData)
    this.taskSvc.UpdateTemplate(this.taskSvc.selectedTemplateData).subscribe((data) => {
      this.snack.open('Template Updated Successfully!', 'OK', { duration: 4000 })
    },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })

      });
  }
  GetTemplateById() {
    debugger
    this.taskSvc.selectedTemplateData.id = this.temId
    this.taskSvc.SearchTemplate(this.taskSvc.selectedTemplateData).subscribe((res: NotificationTemplateVM[]) => {
      this.template = res;
      this.taskSvc.selectedTemplateData = this.template[0]
    });
  }
  SaveTemplate() {
    if (this.temId > 0) {
      this.PutTemplate();
    } else {
      this.taskSvc.SaveTemplate(this.taskSvc.selectedTemplateData).subscribe((res: NotificationTemplateVM) => {
        this.snack.open('Template SuccessFully Saved!', 'OK', { duration: 4000 })
      },
        (err: any) => {
          alert('Error')
        });
    }
  }
}
