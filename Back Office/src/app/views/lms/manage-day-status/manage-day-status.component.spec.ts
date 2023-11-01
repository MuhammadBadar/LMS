import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageDayStatusComponent } from './manage-day-status.component';

describe('ManageDayStatusComponent', () => {
  let component: ManageDayStatusComponent;
  let fixture: ComponentFixture<ManageDayStatusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageDayStatusComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageDayStatusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
