import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageAssignClassComponent } from './manage-assign-class.component';

describe('ManageAssignClassComponent', () => {
  let component: ManageAssignClassComponent;
  let fixture: ComponentFixture<ManageAssignClassComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageAssignClassComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageAssignClassComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
