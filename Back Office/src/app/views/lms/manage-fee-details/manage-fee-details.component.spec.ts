import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageFeeDetailsComponent } from './manage-fee-details.component';

describe('ManageFeeDetailsComponent', () => {
  let component: ManageFeeDetailsComponent;
  let fixture: ComponentFixture<ManageFeeDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageFeeDetailsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageFeeDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
