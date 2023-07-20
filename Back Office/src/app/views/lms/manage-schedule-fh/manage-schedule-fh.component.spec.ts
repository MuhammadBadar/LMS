import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageScheduleFHComponent } from './manage-schedule-fh.component';

describe('ManageScheduleFHComponent', () => {
  let component: ManageScheduleFHComponent;
  let fixture: ComponentFixture<ManageScheduleFHComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageScheduleFHComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageScheduleFHComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
