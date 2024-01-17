import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageFeelinesPopupComponent } from './manage-feelines-popup.component';

describe('ManageFeelinesPopupComponent', () => {
  let component: ManageFeelinesPopupComponent;
  let fixture: ComponentFixture<ManageFeelinesPopupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageFeelinesPopupComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageFeelinesPopupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
