import { TagDialogueComponent } from './../tag-dialogue/tag-dialogue.component';
import { FormBuilder } from '@angular/forms';
import { FormGroup } from '@angular/forms';
import { TodoService } from './../todo.service';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit, ChangeDetectionStrategy, ChangeDetectorRef } from '@angular/core';
import { TodoItem, TagItem } from 'app/shared/models/todo.model';
import { MatDialog } from '@angular/material/dialog';
import PerfectScrollbar from 'perfect-scrollbar';

@Component({
  selector: 'app-todo-details',
  templateUrl: './todo-details.component.html',
  styleUrls: ['./todo-details.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush
})
export class TodoDetailsComponent implements OnInit {

  todo: TodoItem = {
    title: '',
    note: '',
    startDate: '',
    dueDate: '',
    tag: []
  };

  todoForm: FormGroup;
  a: PerfectScrollbar;
  tagList: TagItem[];
  tagMap: Map<number,string> = new Map();

  constructor(
    private tagDialogue: MatDialog,
    private fb: FormBuilder,
    private router: Router,
    private route: ActivatedRoute, 
    private http: HttpClient, 
    private todoService: TodoService,
    private cdr: ChangeDetectorRef) { }

  ngOnInit() {
    
    let id = this.route.snapshot.params['id'];

    if(id) {
      this.todoService.getTodoById(id).subscribe((todo: TodoItem) => {
        this.todo = todo;
        this.buildTodoForm(this.todo);
      });
    } else this.buildTodoForm();

    this.getTagList()

  }

  getTagList() {
    this.tagMap.clear();
    this.todoService.getTagList().subscribe((tagList: TagItem[]) => {
      this.tagList = tagList; 
      tagList.forEach((tag: TagItem) => {
        this.tagMap.set(tag.id,tag.name);
      });
      this.cdr.markForCheck();
    });
  }

  buildTodoForm(todo?: TodoItem) {
    this.todoForm = this.fb.group({
      title: [todo?todo.title:''],
      note: [todo?todo.note:''],
      startDate: [todo?todo.startDate:''],
      dueDate: [todo?todo.dueDate:'']
    });
  }

  saveTodo() {
    if(this.todoForm.invalid)
    return;
    this.todo.title = this.todoForm.get("title").value;
    this.todo.note = this.todoForm.get("note").value;
    this.todo.startDate = this.todoForm.get("startDate").value;
    this.todo.dueDate = this.todoForm.get("dueDate").value;

    this.todoService.updateTodo(this.todo).subscribe(res => {
      this.router.navigateByUrl("/todo/list");
    });

  }

  updateTodoTag(id: number) {
      if(!this.todo.tag.includes(id)) {
        this.todo.tag.push(id);
        this.cdr.markForCheck();
      }
  }

  removeTagFromTodo(tagId) {
    this.todo.tag.splice(this.todo.tag.indexOf(tagId),1);
    this.cdr.markForCheck();
  }

  deleteTodo() {
    if(this.todo.id) {
      this.todoService.deleteTodo(this.todo).subscribe(e=>{
        this.router.navigateByUrl("/todo/list");
      });
    }
  }

  openTagManaginDialogue() {
    const dialogRef = this.tagDialogue.open(TagDialogueComponent, {
      // width: '250px',
      // data: {name: "", animal: ""}
    });

    dialogRef.afterClosed().subscribe(result => {
      this.getTagList();
    });
  }
  }
