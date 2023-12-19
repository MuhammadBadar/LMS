import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageFeetypeschoolComponent } from './manage-feetypeschool.component';

describe('ManageFeetypeschoolComponent', () => {
  let component: ManageFeetypeschoolComponent;
  let fixture: ComponentFixture<ManageFeetypeschoolComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageFeetypeschoolComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageFeetypeschoolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
