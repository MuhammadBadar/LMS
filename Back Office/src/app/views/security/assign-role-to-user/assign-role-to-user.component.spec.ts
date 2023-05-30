import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AssignRoleToUserComponent } from './assign-role-to-user.component';

describe('AssignRoleToUserComponent', () => {
  let component: AssignRoleToUserComponent;
  let fixture: ComponentFixture<AssignRoleToUserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AssignRoleToUserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AssignRoleToUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
