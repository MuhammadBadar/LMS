import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Signup2Component } from './signup2.component';

describe('Signup2Component', () => {
  let component: Signup2Component;
  let fixture: ComponentFixture<Signup2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Signup2Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Signup2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
