import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageCoursescheduleComponent } from './manage-courseschedule.component';

describe('ManageScheduleComponent', () => {
  let component: ManageCoursescheduleComponent;
  let fixture: ComponentFixture<ManageCoursescheduleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageCoursescheduleComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageCoursescheduleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
