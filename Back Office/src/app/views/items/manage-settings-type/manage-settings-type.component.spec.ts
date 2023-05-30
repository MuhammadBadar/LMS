import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageSettingsTypeComponent } from './manage-settings-type.component';

describe('ManageSettingsTypeComponent', () => {
  let component: ManageSettingsTypeComponent;
  let fixture: ComponentFixture<ManageSettingsTypeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageSettingsTypeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageSettingsTypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
