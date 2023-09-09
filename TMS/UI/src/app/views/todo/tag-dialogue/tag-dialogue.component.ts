import { TagItem } from 'app/shared/models/todo.model';
import { Component, OnInit, Inject, ChangeDetectionStrategy, ChangeDetectorRef } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { TodoService } from '../todo.service';

@Component({
  selector: 'app-tag-dialogue',
  templateUrl: './tag-dialogue.component.html',
  styleUrls: ['./tag-dialogue.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class TagDialogueComponent implements OnInit {

  tagList: TagItem[];

  constructor(
    private cdr: ChangeDetectorRef,
    private todoService: TodoService,
    public dialogRef: MatDialogRef<TagDialogueComponent>,
    @Inject(MAT_DIALOG_DATA) private data
    ) { }

  ngOnInit() {
    this.todoService.getTagList().subscribe((tagList:TagItem[]) => {
      this.tagList = tagList;
      this.cdr.markForCheck();
    })
  }

  addTag(tagName: string) {
    if(tagName) {
      let tag = {
        id: this.tagList.length+1, 
        name:tagName
      }
      this.tagList.push(tag);
      this.todoService.saveTag(tag).subscribe(res => {});
      this.cdr.markForCheck();
    }
  }

  deleteTag(tag: TagItem) {
    this.todoService.deleteTag(tag);
  }

}
