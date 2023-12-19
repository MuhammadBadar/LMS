import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageStudentschoolComponent } from './manage-studentschool.component';

describe('ManageStudentschoolComponent', () => {
  let component: ManageStudentschoolComponent;
  let fixture: ComponentFixture<ManageStudentschoolComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageStudentschoolComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageStudentschoolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
