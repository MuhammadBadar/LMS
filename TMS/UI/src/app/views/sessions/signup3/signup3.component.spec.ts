import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Signup3Component } from './signup3.component';

describe('Signup3Component', () => {
  let component: Signup3Component;
  let fixture: ComponentFixture<Signup3Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Signup3Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Signup3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
