import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageGuardianschoolComponent } from './manage-guardianschool.component';

describe('ManageGuardianschoolComponent', () => {
  let component: ManageGuardianschoolComponent;
  let fixture: ComponentFixture<ManageGuardianschoolComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageGuardianschoolComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageGuardianschoolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
