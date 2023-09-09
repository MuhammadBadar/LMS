import { TagItem } from './../../shared/models/todo.model';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Subscription, of } from 'rxjs';
import { Injectable } from '@angular/core';
import { TodoItem } from 'app/shared/models/todo.model';
import { debounceTime, switchMap } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class TodoService {

  searchTerm: BehaviorSubject<string> = new BehaviorSubject<string>('');
  sub: Subscription;

  constructor(private http: HttpClient) {
  }

  getTodoList() {
    return this.http.get("/api/todoList");
  }

  getTodoById(id) {
    return this.http.get("/api/todoList/"+id);
  }

  getTagList() {
    return this.http.get("/api/todoTag");
  }

  updateSearchTerm(term: string) {
    this.searchTerm.next(term);
  }

  getSearchTerm() {
    return this.searchTerm;
  }

  saveTag(tag: TagItem) {
      return this.http.post("/api/todoTag/",tag);
  }

  deleteTag(tag: TagItem) {
    this.http.delete("/api/todoTag/"+tag.id).subscribe(e=>{});
  }

  deleteTodo(todo: TodoItem) {
    return this.http.delete("/api/todoList/"+todo.id);
  }

  updateTodo(todo: TodoItem) {

    let returnTodo;
    todo.selected = false;

    if(!todo.id) {
      todo.id = Math.random()*1000000;
      returnTodo = this.http.post("/api/todoList/", todo);
    }
    else {
      returnTodo = this.http.put("/api/todoList/"+todo.id, todo);
    }
  
    if(this.sub) {
      this.sub.unsubscribe();
      this.sub = returnTodo.subscribe(res => {});
    }

    else {
      this.sub = returnTodo.subscribe(res => {});
    }

    return returnTodo;
  }
}
