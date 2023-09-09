import { ChangeDetectorRef, OnDestroy } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Component, OnInit, ChangeDetectionStrategy } from "@angular/core";
import { CdkDragDrop, moveItemInArray } from "@angular/cdk/drag-drop";
import { TodoService } from "../todo.service";
import { TodoItem, TagItem } from "app/shared/models/todo.model";
import { debounceTime, takeUntil } from "rxjs/operators";
import { Subject } from "rxjs";

@Component({
  selector: "app-todo-list",
  templateUrl: "./todo-list.component.html",
  styleUrls: ["./todo-list.component.scss"],
  changeDetection: ChangeDetectionStrategy.OnPush
})

export class TodoListComponent implements OnInit, OnDestroy {
  todoList: TodoItem[];
  tempList: TodoItem[];
  searchTerm: string;
  test: string;
  tagList: TagItem[];
  tagMap: Map<number, string> = new Map<number, string>();
  isMasterToggled: boolean = false;
  toggledItemNumber: number = 0;
  unsubscribeAll: Subject<any>;

  constructor(
    private todoService: TodoService,
    private cdr: ChangeDetectorRef
  ) {
    this.unsubscribeAll = new Subject();
  }

  ngOnInit() {
    this.tagMap.clear();
    this.todoService.getTodoList()
    .pipe(takeUntil(this.unsubscribeAll))
    .subscribe((res: TodoItem[]) => {
      this.todoList = res;
      this.tempList = res; //used for filtering data

      this.todoService.getTagList()
      .pipe(takeUntil(this.unsubscribeAll))
      .subscribe((res: TagItem[]) => {
        this.tagList = res;
        res.forEach((tag: TagItem) => {
          this.tagMap.set(tag.id, tag.name);
          this.cdr.markForCheck();
        });
      });
    });

    this.todoService.getSearchTerm().pipe(debounceTime(250))
    .pipe(takeUntil(this.unsubscribeAll))
    .subscribe(term => {
      this.searchTerm = term;
      this.cdr.markForCheck();
    });

  }

  ngOnDestroy() {
    this.unsubscribeAll.next();
    this.unsubscribeAll.complete();
  }

  drop(event: CdkDragDrop<TodoItem[]>) {
    moveItemInArray(this.todoList, event.previousIndex, event.currentIndex);
    // Do what you need with the re-arranged array "todoList"
    this.cdr.markForCheck();
  }

  filterTodoListOnTag(tag: TagItem) {
    this.todoList = this.tempList.filter((todo: TodoItem) => {
      return todo.tag.includes(tag.id);
    })
    this.cdr.detectChanges();
  }

  onTodoOptionSelected(event) {
    switch (event.target.innerText) {
      case "All":
        this.todoList = this.tempList;
        break;

      case "Read":
        this.todoList = this.tempList.filter((todo: TodoItem) => {
          return !todo.read;
        });
        break;

      case "Unread":
        this.todoList = this.tempList.filter((todo: TodoItem) => {
          return !todo.read;
        });
        break;

      case "Important":
        this.todoList = this.tempList.filter((todo: TodoItem) => {
          return todo.important;
        });
        break;

      case "Unimportant":
        this.todoList = this.tempList.filter((todo: TodoItem) => {
          return !todo.important;
        });
        break;

      case "Done":
        this.todoList = this.tempList.filter((todo: TodoItem) => {
          return todo.done;
        });
        break;

      case "Undone":
      this.todoList = this.tempList.filter((todo: TodoItem) => {
        return !todo.done;
      });
      break;

      case "Starred":
        this.todoList = this.tempList.filter((todo: TodoItem) => {
          return todo.starred;
        });
        break;

      case "Unstarred":
        this.todoList = this.tempList.filter((todo: TodoItem) => {
          return !todo.starred;
        });
        break;

      default:
        break;
    }

    this.cdr.detectChanges();
  }

  masterToggle() {
    this.toggledItemNumber = 0;

    this.isMasterToggled = !this.isMasterToggled;

    if (this.isMasterToggled) {
      this.todoList.forEach((todo: TodoItem) => {
        todo.selected = true;
        this.toggledItemNumber++;
      });
    } else {
      this.todoList.forEach((todo: TodoItem) => {
        todo.selected = false;
        this.toggledItemNumber--;
      });
    }

    this.cdr.detectChanges();
  }

  toggleCheckBox(todo: TodoItem) {
    todo.selected = !todo.selected;
    if (todo.selected) this.toggledItemNumber++;
    else this.toggledItemNumber--;

    if (this.toggledItemNumber == this.todoList.length)
      this.isMasterToggled = true;
    else if (this.toggledItemNumber == 0) this.isMasterToggled = false;
  }

  toggleImportant(todo: TodoItem) {
    todo.important = !todo.important;
    this.todoService.updateTodo(todo);
  }

  toggleStar(todo: TodoItem) {
    todo.starred = !todo.starred;
    this.todoService.updateTodo(todo);
  }

  toggleRead(todo: TodoItem) {
    todo.read = !todo.read;
    this.todoService.updateTodo(todo);
  }

  toggleDone(todo: TodoItem) {
    todo.done = !todo.done;
    this.todoService.updateTodo(todo);
  }
}
