import { Component, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { AddCommentComponent } from './add-comment/add-comment.component';

@Component({
  selector: 'app-comments-list',
  templateUrl: './comments-list.component.html',
  styleUrls: ['./comments-list.component.css']
})
export class CommentsListComponent  implements OnInit {
  
  private dialogRefs: MatDialogRef<AddCommentComponent>;

  constructor( public dialog: MatDialog) { }

  ngOnInit(): void {
  }
  public addEvent() {
    this.dialogRefs = this.dialog.open(AddCommentComponent, {
      width: '450px'
    });
    this.dialogRefs.afterClosed()
      .subscribe((res) => {
        if (!res) {
          return;
        }
      });
  }

}
