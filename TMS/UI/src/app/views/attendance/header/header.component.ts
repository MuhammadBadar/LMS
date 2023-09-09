import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SignOutDialogComponent } from '../sign-out-dialog/sign-out-dialog.component';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  constructor(
    private route:Router,
    public dialog: MatDialog,
  ) { }

  ngOnInit(): void {
  }
  SignOut(){
    let dialogRef = this.dialog.open(SignOutDialogComponent, {
      disableClose:true, panelClass: 'calendar-form-dialog',  width: '350px'
  , data: {   }
  
      
  });
  dialogRef.afterClosed()
      .subscribe((res) => {
          this.ngOnInit();
     });
  }
}
