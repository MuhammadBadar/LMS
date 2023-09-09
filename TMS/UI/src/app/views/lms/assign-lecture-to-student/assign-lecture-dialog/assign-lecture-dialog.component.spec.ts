import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignLectureDialogComponent } from './assign-lecture-dialog.component';

describe('AssignLectureDialogComponent', () => {
  let component: AssignLectureDialogComponent;
  let fixture: ComponentFixture<AssignLectureDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssignLectureDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssignLectureDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
