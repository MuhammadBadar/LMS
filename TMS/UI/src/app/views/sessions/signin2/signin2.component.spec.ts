import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Signin2Component } from './signin2.component';

describe('Signin2Component', () => {
  let component: Signin2Component;
  let fixture: ComponentFixture<Signin2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Signin2Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Signin2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
