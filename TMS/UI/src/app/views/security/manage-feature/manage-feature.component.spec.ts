import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageFeatureComponent } from './manage-feature.component';

describe('ManageFeatureComponent', () => {
  let component: ManageFeatureComponent;
  let fixture: ComponentFixture<ManageFeatureComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageFeatureComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageFeatureComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
