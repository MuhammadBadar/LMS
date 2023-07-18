import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageAssignTaskComponent } from './manage-assign-task.component';

describe('ManageAssignTaskComponent', () => {
  let component: ManageAssignTaskComponent;
  let fixture: ComponentFixture<ManageAssignTaskComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageAssignTaskComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageAssignTaskComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
