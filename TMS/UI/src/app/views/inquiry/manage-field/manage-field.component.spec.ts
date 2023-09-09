import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageFieldComponent } from './manage-field.component';

describe('ManageFieldComponent', () => {
  let component: ManageFieldComponent;
  let fixture: ComponentFixture<ManageFieldComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageFieldComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageFieldComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
