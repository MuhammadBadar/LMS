import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageUserreportComponent } from './manage-userreport.component';

describe('ManageUserreportComponent', () => {
  let component: ManageUserreportComponent;
  let fixture: ComponentFixture<ManageUserreportComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageUserreportComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageUserreportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
