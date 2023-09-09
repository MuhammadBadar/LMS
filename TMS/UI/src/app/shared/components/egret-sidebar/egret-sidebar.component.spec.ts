import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EgretSidebarComponent } from './egret-sidebar.component';

describe('EgretSidebarComponent', () => {
  let component: EgretSidebarComponent;
  let fixture: ComponentFixture<EgretSidebarComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EgretSidebarComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EgretSidebarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
