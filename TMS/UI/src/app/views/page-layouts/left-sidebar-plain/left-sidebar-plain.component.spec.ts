import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeftSidebarPlainComponent } from './left-sidebar-plain.component';

describe('LeftSidebarPlainComponent', () => {
  let component: LeftSidebarPlainComponent;
  let fixture: ComponentFixture<LeftSidebarPlainComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeftSidebarPlainComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeftSidebarPlainComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
