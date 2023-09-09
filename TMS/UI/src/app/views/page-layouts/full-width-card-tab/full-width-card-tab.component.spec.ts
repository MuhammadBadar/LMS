import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FullWidthCardTabComponent } from './full-width-card-tab.component';

describe('FullWidthCardTabComponent', () => {
  let component: FullWidthCardTabComponent;
  let fixture: ComponentFixture<FullWidthCardTabComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FullWidthCardTabComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FullWidthCardTabComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
