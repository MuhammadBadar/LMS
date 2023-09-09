import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardDarkComponent } from './dashboard-dark.component';

describe('DashboardDarkComponent', () => {
  let component: DashboardDarkComponent;
  let fixture: ComponentFixture<DashboardDarkComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DashboardDarkComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DashboardDarkComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
