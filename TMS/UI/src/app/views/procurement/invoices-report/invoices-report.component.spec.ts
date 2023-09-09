import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InvoicesReportComponent } from './invoices-report.component';

describe('InvoicesReportComponent', () => {
  let component: InvoicesReportComponent;
  let fixture: ComponentFixture<InvoicesReportComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InvoicesReportComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InvoicesReportComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
