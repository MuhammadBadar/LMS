
import { Pipe, PipeTransform } from '@angular/core';
import { DatePipe } from '@angular/common';

export enum DateFormat {
  short = 'short date',
  medium = 'medium date',
  long = 'long date',
  dateOnly = 'date only',
}

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe extends DatePipe implements PipeTransform {
  private readonly datePatterns = new Map<string, string>([
    ['short', 'd/M/y, h:mm:ss a'],
    ['medium', 'MMM d, y, h:mm:ss a'],
    ['long', 'EEEE, LLLL d, y, h:mm:ss a'],
    ['dateOnly', 'MMM d, y'],
  ]);
  override transform(time: any): any {
    let hour = (time.split(':'))[0]
    let min = (time.split(':'))[1]
    let part = hour > 12 ? 'pm' : 'am';
    if (parseInt(hour) == 0)
      hour = 12;
    min = (min + '').length == 1 ? `0${min}` : min;
    hour = hour > 12 ? hour - 12 : hour;
    hour = (hour + '').length == 1 ? `0${hour}` : hour;
    return `${hour}:${min} ${part}`
  }

}
