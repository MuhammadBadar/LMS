import { NotificationLogService } from './../../notification/NotificationLogService';
import { id } from '@swimlane/ngx-datatable';
import { Component, Input, OnInit, } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { EnumType } from '../models/EnumType';
import { EnumValueVM } from '../models/EnumValueVM';
import { AttachmentsVM, TaskVM } from '../models/task-vm';
import { TaskCommentVM } from '../models/taskcomment-vm';
import { TaskService } from '../task.service';
import { TimeAgoPipe } from 'time-ago-pipe'
import Swal from 'sweetalert2'
import { SecurityService } from 'app/views/security/security.service';
import { UserVM } from 'app/views/security/models/user-vm';
import { NotificationVM } from '../models/NotificationVM';
import { NotificationTemplateVM } from '../models/NotificationTemplateVM';
import { NotificationLogVM } from 'app/views/notification/NotificationLogVM';

@Component({
  selector: 'app-manage-tasks',
  templateUrl: './manage-tasks.component.html',
  styleUrls: ['./manage-tasks.component.css']
})
export class ManageTasksComponent implements OnInit {
  imageId;
  statusId:number;
  TaskStatus: string;
  showCount = false;
  previewImage = false;
  showMask = false;
  currentLightBoxImage;
  currentIndex = 0;
  controls = true;
  totalImageCount = 0
  Data;
  modules: EnumValueVM[];
  User: UserVM[]
  commentedUser:UserVM[];
  commentedUserName:string;
  Status: EnumValueVM[];
  Priority: EnumValueVM[];
  TaskId: number;
  Time;
  CreatedOn = new Date;;
  Name: string;
  Size;
  DocPath;
  templates: NotificationTemplateVM[]
  Id: number = null;
  Edit: boolean = false;
  Add: boolean = true;
  FileDetails = [];
  UpdateDetails = [];
  comments: TaskCommentVM[];
  gettaskById: TaskVM;
  constructor(
    private nLogSVC:NotificationLogService,
    private secSrvc: SecurityService,
    private route: ActivatedRoute,
    public taskService: TaskService,
    private snack: MatSnackBar,
  ) {
    this.nLogSVC.notification= new NotificationLogVM;
    this.taskService.selectedTask = new TaskVM;
    this.taskService.selectedTaskComment = new TaskCommentVM
    this.taskService.file = new AttachmentsVM;
    this.taskService.selectedMail = new NotificationVM
    this.taskService.selectedTemplateData = new NotificationTemplateVM
  }
  
  ngOnInit(): void {
    this.taskService.SearchTemplate(this.taskService.selectedTemplateData).subscribe((res: NotificationTemplateVM[]) => {
      this.templates = res;
    })
    this.route.queryParams.subscribe(params => {
      this.TaskId = params.id;
    });
    this.secSrvc.getUserList().subscribe((res: UserVM[]) => {
      this.User = res;
    });
    this.GetEnumValues(EnumType.Priority);
    this.GetEnumValues(EnumType.Status);
    if (this.TaskId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetTaskById();
      this.GetTaskcomments();
    }
  }
 
  onPreviewImage(index: number): void {
    this.imageId= index;
    this.showCount = true;
    this.showMask = true;
    this.previewImage = true;
    this.currentIndex = index;
    this.totalImageCount = this.FileDetails.length;
    this.currentLightBoxImage = this.FileDetails[index].base64File
  }
  onClosePreview() {
    this.previewImage = false;
    this.showMask = false;
  }
  next(): void {
    debugger
    this.currentIndex = this.currentIndex + 1
    if (this.currentIndex > this.FileDetails.length - 1) {
      this.currentIndex = 0
    }
    this.currentLightBoxImage = this.FileDetails[this.currentIndex].base64File;
  }
  prev(): void {
    debugger
    this.currentIndex = this.currentIndex - 1
    if (this.currentIndex < 0) {
      this.currentIndex = this.FileDetails.length - 1
    }
    this.currentLightBoxImage = this.FileDetails[this.currentIndex].base64File;

  }
  Delete() {
    debugger
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
        debugger
        console.warn(this.currentIndex)
        this.UpdateDetails = this.FileDetails.filter(i => i.base64File !== this.FileDetails[this.currentIndex].base64File);
            this.totalImageCount = this.UpdateDetails?.length;
        if (this.FileDetails[this.currentIndex].id != 0) {
          this.taskService.selectedTask.attachments[0].id = this.FileDetails[this.currentIndex]?.id
          this.taskService.selectedTask.attachments[0].dBoperation = 3;
          this.taskService.UpdateTask(this.taskService.selectedTask).subscribe((data) => {
         
          },
            (err: any) => {
            });
        }
        Swal.fire(
          'Deleted!',
          'Image has been deleted.',
          'success'
        )
        this.next();
        this.FileDetails = this.UpdateDetails
        if(this.FileDetails.length==0){
          this.showMask=false;
          this.showCount = false;
          this.previewImage = false;
        }
      }

    })

    // console.warn(this.FileDetails[this.currentIndex].name)
    // console.warn(this.FileDetails[this.currentIndex].taskId)
    // console.warn(this.FileDetails[this.currentIndex].id)
    // console.warn(this.FileDetails[this.currentIndex])


  }
  GetEnumValues(etype: EnumType) {
    this.taskService.getEnumValues(etype).subscribe((res: EnumValueVM[]) => {
      if (etype == EnumType.Status)
        this.Status = res;
      else if (etype == EnumType.Priority)
        this.Priority = res;
    },
      (err: any) => {
        alert('Error')
      });
  }
  GetTaskById() {
    debugger
    this.taskService.GetTaskById(this.TaskId).subscribe((res: TaskVM) => {
      this.gettaskById = res;
      this.taskService.selectedTask = this.gettaskById[0];
      this.statusId= this.gettaskById[0].statusId
      this.FileDetails = this.taskService.selectedTask.attachments;
    });
  }
  refreshPage(){
    this.taskService.selectedTask = new TaskVM();
  }
  SaveTask() {
   
    debugger;
    if (this.TaskId > 0) {
      this.UpdateTask();
    }
    else {
      this.taskService.selectedTask.attachments = this.FileDetails;
      console.warn(this.taskService.selectedTask)
      this.taskService.SaveTask(this.taskService.selectedTask).subscribe((res: TaskVM) => {
        debugger;
        if (res !== null) {
          if(!res.hasErrors)
          {
            this.snack.open('Task Successfully Added!', 'OK', { duration: 4000 });
            this.refreshPage();
            return;
          }
          else
          { 
            this.snack.open('Unable to save Task!', 'Not OK', { duration: 4000 });
            return;
          }

            this.taskService.GetTaskById(res.id).subscribe((res: TaskVM) => {
            this.gettaskById = res
            console.warn(this.gettaskById)
            if (this.gettaskById !== null) {

              
              
              console.warn("hjk+${this.gettaskById}")
              //send notification Mail
              var data = this.templates.filter(e => e.keyCode == 'NotificationToUser_OnTaskCreation')

              data[0].subject = data[0].subject.replace('#TaskId', this.gettaskById[0].id)
              data[0].body = data[0].body.replace('#User', this.gettaskById[0].user)
              data[0].body = data[0].body.replace('#TaskId', this.gettaskById[0].id)
              data[0].body = data[0].body.replace('#TaskPriority', this.gettaskById[0].taskPriority)
              data[0].body = data[0].body.replace('#ContactNumber', this.gettaskById[0].directSupervisorPhoneNumber)

               //log sms notification
               this.nLogSVC.notification.userId=this.taskService.selectedTask.userId
               this.nLogSVC.notification.phone=this.taskService.selectedTask.userPhoneNumber
               this.nLogSVC.notification.sMS=data[0].body
               this.SaveNotificationLog( this.nLogSVC.notification);

              this.taskService.selectedMail.senderMail = this.gettaskById[0].directSupervisorEmail;
              this.taskService.selectedMail.receiverMail = this.gettaskById[0].userMail;
              this.taskService.selectedMail.mailBody = data[0].body
              this.taskService.selectedMail.mailSubject = data[0].subject

              this.taskService.SendMail(this.taskService.selectedMail).subscribe((data) => { })

              this.snack.open('Task Successfully Added!', 'OK', { duration: 4000 })
              this.taskService.selectedTask = new TaskVM;
              this.ngOnInit();
              this.FileDetails.length = 0;
            }
          });
        }
        else {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        }
      },
        (err: any) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        });
    }
  }
  SaveNotificationLog(nLog){
    console.warn(nLog)  
    console.warn(this.nLogSVC.notification) 
    this.nLogSVC.SaveNotificationLog(nLog).subscribe((res: NotificationLogVM) => { },
    (err: any) => {
      this.snack.open('Error Occured!', 'OK', { duration: 4000 })
    });
}
  UpdateTask(){
    this.UpdateDetails = this.FileDetails.filter(i => i.id == 0);
      this.taskService.selectedTask.attachments = this.UpdateDetails;
      this.taskService.UpdateTask(this.taskService.selectedTask).subscribe((data) => {
        this.snack.open('Task Updated Successfully!', 'OK', { duration: 4000 })
        this.ngOnInit();
      },
      (err: any) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      });
  }
  PutTask() {
    debugger
    
    if(this.taskService.selectedTask.statusId !== this.statusId){
    var loginUser = localStorage.getItem('TMSUserName')
   // this.taskService.selectedTask = this.gettaskById[0];
    if (loginUser == this.gettaskById[0].user || loginUser == this.gettaskById[0].directSupervisorName) {
      this.UpdateDetails = this.FileDetails.filter(i => i.id == 0);
      this.taskService.selectedTask.attachments = this.UpdateDetails;
      this.taskService.UpdateTask(this.taskService.selectedTask).subscribe((data) => {
        this.snack.open('Task Updated Successfully!', 'OK', { duration: 4000 })
        console.warn(this.taskService.selectedTask.statusId)
          if (this.taskService.selectedTask.statusId == 104001) {
            this.TaskStatus = "Open"
          } else if (this.taskService.selectedTask.statusId == 104002) {
            this.TaskStatus = "InProgress"
          } else if (this.taskService.selectedTask.statusId == 1004003) {
            this.TaskStatus = "InTesting"
          } else if (this.taskService.selectedTask.statusId == 1004004) {
            this.TaskStatus = "Closed"
          } else if (this.taskService.selectedTask.statusId == 1004005) {
            this.TaskStatus = "ReOpened"
          } else if (this.taskService.selectedTask.statusId == 1004006) {
            this.TaskStatus = "Dependent"
          } else if (this.taskService.selectedTask.statusId == 1004007) {
            this.TaskStatus = "RnD"
          }

          if (loginUser == this.gettaskById[0].user) {
            var data1 = this.templates.filter(e => e.keyCode == 'NotificationToDirectSupervisor_OnStatusChange')

            data1[0].subject = data1[0].subject.replace('#TaskId', this.gettaskById[0].id)
            data1[0].body = data1[0].body.replace('#Supervisor', this.gettaskById[0].directSupervisorName)
            data1[0].body = data1[0].body.replace('#TaskId', this.gettaskById[0].id)
            data1[0].body = data1[0].body.replace('#OldStatus', this.gettaskById[0].taskStatus)
            data1[0].body = data1[0].body.replace('#NewStatus', this.TaskStatus)

              //log sms notification
              this.nLogSVC.notification.userId=this.taskService.selectedTask.userId
              this.nLogSVC.notification.phone=this.taskService.selectedTask.directSupervisorPhoneNumber
              this.nLogSVC.notification.sMS=data1[0].body
              this.SaveNotificationLog( this.nLogSVC.notification);

            this.taskService.selectedMail.receiverMail = this.gettaskById[0].directSupervisorEmail;
            this.taskService.selectedMail.senderMail = this.gettaskById[0].userMail;
            this.taskService.selectedMail.mailBody = data1[0].body
            this.taskService.selectedMail.mailSubject = data1[0].subject
          }
          else if (loginUser == this.gettaskById[0].directSupervisorName) {
            var data1 = this.templates.filter(e => e.keyCode == 'NotificationToUser_OnStatusChange')

            data1[0].subject = data1[0].subject.replace('#TaskId', this.gettaskById[0].id)
            data1[0].body = data1[0].body.replace('#User', this.gettaskById[0].user)
            data1[0].body = data1[0].body.replace('#TaskId', this.gettaskById[0].id)
            data1[0].body = data1[0].body.replace('#OldStatus', this.gettaskById[0].taskStatus)
            data1[0].body = data1[0].body.replace('#NewStatus', this.TaskStatus)

             //log sms notification
             this.nLogSVC.notification.userId=this.taskService.selectedTask.userId
             this.nLogSVC.notification.phone=this.taskService.selectedTask.userPhoneNumber
             this.nLogSVC.notification.sMS=data1[0].body
             this.SaveNotificationLog( this.nLogSVC.notification);

            this.taskService.selectedMail.receiverMail = this.gettaskById[0].userMail;
            this.taskService.selectedMail.senderMail = this.gettaskById[0].directSupervisorEmail;
            this.taskService.selectedMail.mailBody = data1[0].body
            this.taskService.selectedMail.mailSubject = data1[0].subject

          }
          this.taskService.SendMail(this.taskService.selectedMail).subscribe((data) => { })
          this.ngOnInit();
      },
        (err: any) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        });
    } else {
      this.snack.open('You Have no rights to update this Task!', 'OK', { duration: 4000 })
    }
  }
 // this.ngOnInit();
  }
  handleFileInput(e) {
    debugger
    for (let index = 0; index < e.target.files.length; index++) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[index]);
      this.Name = e.target.files[index].name;
      this.Size = e.target.files[index].size;
      reader.onload = (event: any) => {
        console.warn(event)
        this.Data = event.target.result;
        const newRow = {
          "id": 0,
          "isActive": true,
          "dBoperation": 1,
          "taskId": 0,
          "docPath": "string",
          "base64File": event.target.result,
          "name": e.target.files[index].name.toString(),
          "size": e.target.files[index].size.toString(),
          "createdOn": this.CreatedOn
        }
        this.FileDetails.push(newRow)
      };
    }
  }
  GetTaskcomments() {
    if (this.TaskId > 0) {
      this.taskService.getTaskComments(this.TaskId).subscribe((res: TaskCommentVM[]) => {
        this.comments = res;
        console.warn(this.comments)
      });
    }
  }
  SaveTaskComment() {
    
    debugger;
    if (this.TaskId > 0) {
      this.taskService.selectedTaskComment.taskId = this.TaskId;
      this.taskService.SaveTaskComment(this.taskService.selectedTaskComment).subscribe((data) => {
        this.taskService.selectedTaskComment.comment = '';
        this.snack.open('Comments Saved Successfully', 'OK', { duration: 4000 });
        this.taskService.getTaskComments(this.TaskId).subscribe((res: TaskCommentVM[]) => {
          this.comments = res;
        });
        var loginUser = localStorage.getItem('TMSUserName')
         this.commentedUser= this.User.filter(u => u.id == this.taskService.selectedTaskComment.userId)
        this.commentedUserName=this.commentedUser[0].userName
          console.warn( this.commentedUserName)
        if (this.commentedUserName == this.gettaskById[0].user || 
          this.commentedUserName !== this.gettaskById[0].directSupervisorName ) {
          var data1 = this.templates.filter(e => e.keyCode == 'NotificationToDirectSupervisor_OnTaskComments')

          data1[0].subject = data1[0].subject.replace('#TaskId', this.gettaskById[0].id)
          data1[0].body = data1[0].body.replace('#DirectSupervisor', this.gettaskById[0].directSupervisorName)
          data1[0].body = data1[0].body.replace('#TaskId', this.gettaskById[0].id)
          data1[0].body = data1[0].body.replace('#Comment', this.taskService.selectedTaskComment.comment)
          data1[0].body = data1[0].body.replace('#SenderName', this.commentedUserName)

          this.taskService.selectedMail.receiverMail = this.gettaskById[0].directSupervisorEmail;
          this.taskService.selectedMail.senderMail = "bintameer212@gmail.com";
          this.taskService.selectedMail.mailBody = data1[0].body
          this.taskService.selectedMail.mailSubject = data1[0].subject
          this.taskService.SendMail(this.taskService.selectedMail).subscribe((data) => { })
        }
         if(this.commentedUserName !== this.gettaskById[0].user || 
          this.commentedUserName == this.gettaskById[0].directSupervisorName){
          var data1 = this.templates.filter(e => e.keyCode == 'NotificationToUser_OnTaskComments')

          data1[0].subject = data1[0].subject.replace('#TaskId', this.gettaskById[0].id)
          data1[0].body = data1[0].body.replace('#User', this.gettaskById[0].user)
          data1[0].body = data1[0].body.replace('#SenderName', this.commentedUserName)
          data1[0].body = data1[0].body.replace('#TaskId', this.gettaskById[0].id)
          data1[0].body = data1[0].body.replace('#Comment', this.taskService.selectedTaskComment.comment)

          this.taskService.selectedMail.receiverMail = this.gettaskById[0].userMail;
          this.taskService.selectedMail.senderMail = "bintameer212@gmail.com";
          this.taskService.selectedMail.mailBody = data1[0].body
          this.taskService.selectedMail.mailSubject = data1[0].subject
          this.taskService.SendMail(this.taskService.selectedMail).subscribe((data) => { })

        }
        this.taskService.selectedTaskComment= new TaskCommentVM
        //this.loader.close();
      },
        (err: any) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        });
    }
  }
}
