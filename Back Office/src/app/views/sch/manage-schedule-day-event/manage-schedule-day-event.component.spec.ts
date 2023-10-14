import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageScheduleDayEventComponent } from './manage-schedule-day-event.component';

describe('ManageScheduleDayEventComponent', () => {
  let component: ManageScheduleDayEventComponent;
  let fixture: ComponentFixture<ManageScheduleDayEventComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageScheduleDayEventComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageScheduleDayEventComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
