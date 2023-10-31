import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageUsertaskComponent } from './manage-usertask.component';

describe('ManageUsertaskComponent', () => {
  let component: ManageUsertaskComponent;
  let fixture: ComponentFixture<ManageUsertaskComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageUsertaskComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageUsertaskComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
