import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChartofAccountCodeComponent } from './chartof-account-code.component';

describe('ChartofAccountCodeComponent', () => {
  let component: ChartofAccountCodeComponent;
  let fixture: ComponentFixture<ChartofAccountCodeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChartofAccountCodeComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChartofAccountCodeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
