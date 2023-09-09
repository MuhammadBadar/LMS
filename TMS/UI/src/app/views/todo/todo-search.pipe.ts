import { Pipe, PipeTransform } from '@angular/core';
import { TodoItem } from 'app/shared/models/todo.model';

@Pipe({
  name: 'todoSearch'
})
export class TodoSearchPipe implements PipeTransform {

  transform(value: TodoItem[], term?: string): TodoItem[] {

    if(value !== undefined && term) {
      return value.filter((todo: TodoItem) => {
        return todo.title.toLowerCase().match(term.toLowerCase())
         || todo.note.toLowerCase().match(term.toLowerCase());
      });
    }
      return value;
  }

}
