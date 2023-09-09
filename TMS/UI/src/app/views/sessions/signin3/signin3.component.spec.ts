import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Signin3Component } from './signin3.component';

describe('Signin3Component', () => {
  let component: Signin3Component;
  let fixture: ComponentFixture<Signin3Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Signin3Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Signin3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
