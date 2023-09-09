import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StudentLecturesComponent } from './student-lectures.component';

describe('StudentLecturesComponent', () => {
  let component: StudentLecturesComponent;
  let fixture: ComponentFixture<StudentLecturesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StudentLecturesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StudentLecturesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
