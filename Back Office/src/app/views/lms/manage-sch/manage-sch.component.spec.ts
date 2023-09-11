import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageSchComponent } from './manage-sch.component';

describe('ManageSchComponent', () => {
  let component: ManageSchComponent;
  let fixture: ComponentFixture<ManageSchComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageSchComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageSchComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
