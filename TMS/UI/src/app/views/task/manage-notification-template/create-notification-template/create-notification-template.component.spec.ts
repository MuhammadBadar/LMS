import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateNotificationTemplateComponent } from './create-notification-template.component';

describe('CreateNotificationTemplateComponent', () => {
  let component: CreateNotificationTemplateComponent;
  let fixture: ComponentFixture<CreateNotificationTemplateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CreateNotificationTemplateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateNotificationTemplateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
