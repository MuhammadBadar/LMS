import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManagePermissionsComponent } from './manage-permissions.component';

describe('ManagePermissionsComponent', () => {
  let component: ManagePermissionsComponent;
  let fixture: ComponentFixture<ManagePermissionsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManagePermissionsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManagePermissionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
