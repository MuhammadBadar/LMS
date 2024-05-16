import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChartOfAccountListComponent } from './chart-of-account-list.component';

describe('ChartOfAccountListComponent', () => {
  let component: ChartOfAccountListComponent;
  let fixture: ComponentFixture<ChartOfAccountListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChartOfAccountListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChartOfAccountListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
