import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageScheduleListComponent } from './manage-schedule-list.component';

describe('ManageScheduleListComponent', () => {
  let component: ManageScheduleListComponent;
  let fixture: ComponentFixture<ManageScheduleListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageScheduleListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageScheduleListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
