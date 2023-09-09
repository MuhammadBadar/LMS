import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LeftSidebarCardComponent } from './left-sidebar-card.component';

describe('LeftSidebarCardComponent', () => {
  let component: LeftSidebarCardComponent;
  let fixture: ComponentFixture<LeftSidebarCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LeftSidebarCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LeftSidebarCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
