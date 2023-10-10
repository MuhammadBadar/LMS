import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageNotificationTemplateComponent } from './manage-notification-template.component';

describe('ManageNotificationTemplateComponent', () => {
  let component: ManageNotificationTemplateComponent;
  let fixture: ComponentFixture<ManageNotificationTemplateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ManageNotificationTemplateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ManageNotificationTemplateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
