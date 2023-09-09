import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SaleInvoiceComponent } from './sale-invoice.component';

describe('SaleInvoiceComponent', () => {
  let component: SaleInvoiceComponent;
  let fixture: ComponentFixture<SaleInvoiceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SaleInvoiceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SaleInvoiceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
