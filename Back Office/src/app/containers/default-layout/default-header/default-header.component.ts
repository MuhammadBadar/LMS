import { Component, Input } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { HeaderComponent } from '@coreui/angular';
import { ManageDayStatusComponent } from 'src/app/views/lms/manage-day-status/manage-day-status.component';

@Component({
  selector: 'app-default-header',
  templateUrl: './default-header.component.html',
})
export class DefaultHeaderComponent extends HeaderComponent {
  dialogRef: any;

  constructor(public dialog: MatDialog,
    private route: Router,) {
    super();
  }

  OpenUserDialog() {
    this.dialogRef = this.dialog.open(ManageDayStatusComponent, {
      width: '1200px',
      height: '400px',
    });

    this.dialogRef.afterClosed().subscribe((res: any) => {
      // this.dialogrefe.close();
      localStorage.clear();
      this.route.navigate(['/secLogin']);
      // Handle dialog closure if needed
    });
  }

  break(){
    localStorage.clear();
    this.route.navigate(['/secLogin']);
  }

  LogOut() {
    // Open user dialog before logout
    this.OpenUserDialog();


    // LogOut logic after dialog closure
    // this.dialogRef.afterClosed().subscribe(() => {
      // console.error("err");
      // localStorage.clear();
      // Navigate to the logout page (replace '/logout' with your actual logout page URL)
      // window.location.href = '//secLogin';
      // this.route.navigate(['/secLogin']);
      // this.dialogRefe.close();
    // });
  }

  @Input() sidebarId: string = "sidebar";

  public newMessages = new Array(4)
  public newTasks = new Array(5)
  public newNotifications = new Array(5)
}
