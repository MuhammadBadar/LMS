
import { Component, OnInit } from '@angular/core';
import { NotificationTemplateVM } from '../models/NotificationTemplateVM';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { TMSService } from '../tms.service';
import { CreateNotificationTemplateComponent } from './create-notification-template/create-notification-template.component';

@Component({
  selector: 'app-manage-notification-template',
  templateUrl: './manage-notification-template.component.html',
  styleUrls: ['./manage-notification-template.component.css']
})
export class ManageNotificationTemplateComponent implements OnInit {
  dataSource;
  //displayedColumns = ['keycode', 'templatename', 'subject', 'body', 'actions']
  displayedColumns = ['templatename', 'subject', 'body', 'actions']
  templates: NotificationTemplateVM[]
  
  Edit: boolean = false;
  Add: boolean = true;
  dialogRef: any;
  dialog: any;
  constructor(
    private route: Router,
    public taskSvc: TMSService
  ) {
    this.taskSvc.selectedTemplateData = new NotificationTemplateVM
  }
  ngOnInit(): void {
    this.taskSvc.selectedTemplateData = new NotificationTemplateVM
    this.taskSvc.SearchTemplate(this.taskSvc.selectedTemplateData).subscribe((res: NotificationTemplateVM[]) => {
      this.templates = res;
      this.dataSource = new MatTableDataSource(this.templates);
    });
  }
  EditTemplate(tem) {
    this.route.navigate(['/task/createTemplate'], { queryParams: { id: tem.id } });
  }
  
 
  DeleteTemplate(id) {
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
        this.taskSvc.DeleteTemplate(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Template has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
}
