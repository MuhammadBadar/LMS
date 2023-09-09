import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LogEventComponent } from './log-event.component';

describe('LogEventComponent', () => {
  let component: LogEventComponent;
  let fixture: ComponentFixture<LogEventComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LogEventComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LogEventComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
