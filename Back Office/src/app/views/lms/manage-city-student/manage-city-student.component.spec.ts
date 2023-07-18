import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageCityStudentComponent } from './manage-city-student.component';

describe('ManageCityStudentComponent', () => {
  let component: ManageCityStudentComponent;
  let fixture: ComponentFixture<ManageCityStudentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageCityStudentComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageCityStudentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
