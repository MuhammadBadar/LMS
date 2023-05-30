import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PayablesComponent } from './payables.component';

describe('PayablesComponent', () => {
  let component: PayablesComponent;
  let fixture: ComponentFixture<PayablesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PayablesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PayablesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
