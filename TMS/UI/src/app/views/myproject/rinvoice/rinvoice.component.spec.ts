import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RinvoiceComponent } from './rinvoice.component';

describe('RinvoiceComponent', () => {
  let component: RinvoiceComponent;
  let fixture: ComponentFixture<RinvoiceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RinvoiceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RinvoiceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
