import { CalendarEventAction, CalendarEvent } from 'angular-calendar';
import {
  startOfDay,
  endOfDay,
  subDays,
  addDays,
  endOfMonth,
  isSameDay,
  isSameMonth,
  addHours
} from 'date-fns';

export class EgretCalendarEvent implements CalendarEvent {
  _id?: string;
  role?:string;
  name?:string;
  start: Date;
  user?:string;
  responsibility?:string;
  end?: Date;
  title: string;
  color?: {
    primary: string;
    secondary: string;
    Name?:string
  };
  actions?: CalendarEventAction[];
  allDay?: boolean;
  cssClass?: string;
  resizable?: {
    beforeStart?: boolean;
    afterEnd?: boolean;
  };
  draggable?: boolean;
  meta?: {
    location: string,
    notes: string,
    responsibility:string
    Responsibility:string
    description:string
  };

  constructor(data?) {
    data = data || {};
    this.start = new Date(data.start) || startOfDay(new Date());
    this.end = data.end ? new Date(data.end) : null;
    this._id = data._id || '';
    this.title = data.title || '';
    this.color = {
      primary: data.color && data.color.primary || '#247ba0',
      secondary: data.color && data.color.secondary || '#D1E8FF'
    };
    this.draggable = data.draggable || true;
    this.resizable = {
      beforeStart: data.resizable && data.resizable.beforeStart || true,
      afterEnd: data.resizable && data.resizable.afterEnd || true
    };
    this.actions = data.actions || [];
    this.allDay = data.allDay || false;
    this.cssClass = data.cssClass || '';
    this.meta = {
      location: data.meta && data.meta.location || '',
      notes: data.meta && data.meta.notes || '',
      responsibility: data.meta && data.meta.responsibility || '',
      Responsibility: data.meta && data.meta.Responsibility || '',
      description: data.meta && data.meta.description || ''
    };
  }
}