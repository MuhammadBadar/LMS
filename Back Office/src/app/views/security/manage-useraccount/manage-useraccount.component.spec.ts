import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageUseraccountComponent } from './manage-useraccount.component';

describe('ManageUseraccountComponent', () => {
  let component: ManageUseraccountComponent;
  let fixture: ComponentFixture<ManageUseraccountComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageUseraccountComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageUseraccountComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
