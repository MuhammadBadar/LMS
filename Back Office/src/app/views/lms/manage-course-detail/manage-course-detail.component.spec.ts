import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageCourseDetailComponent } from './manage-course-detail.component';

describe('ManageCourseDetailComponent', () => {
  let component: ManageCourseDetailComponent;
  let fixture: ComponentFixture<ManageCourseDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageCourseDetailComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageCourseDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
