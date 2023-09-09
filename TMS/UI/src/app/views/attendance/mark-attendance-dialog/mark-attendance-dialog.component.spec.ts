import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MarkAttendanceDialogComponent } from './mark-attendance-dialog.component';

describe('MarkAttendanceDialogComponent', () => {
  let component: MarkAttendanceDialogComponent;
  let fixture: ComponentFixture<MarkAttendanceDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MarkAttendanceDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MarkAttendanceDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
