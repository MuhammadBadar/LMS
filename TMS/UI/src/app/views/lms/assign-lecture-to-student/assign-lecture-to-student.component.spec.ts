import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignLectureToStudentComponent } from './assign-lecture-to-student.component';

describe('AssignLectureToStudentComponent', () => {
  let component: AssignLectureToStudentComponent;
  let fixture: ComponentFixture<AssignLectureToStudentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssignLectureToStudentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssignLectureToStudentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
