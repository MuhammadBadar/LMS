import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageFeepaymentschoolComponent } from './manage-feepaymentschool.component';

describe('ManageFeepaymentschoolComponent', () => {
  let component: ManageFeepaymentschoolComponent;
  let fixture: ComponentFixture<ManageFeepaymentschoolComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageFeepaymentschoolComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageFeepaymentschoolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
