import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageClientComponent } from './manage-client.component';

describe('ManageClientComponent', () => {
  let component: ManageClientComponent;
  let fixture: ComponentFixture<ManageClientComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageClientComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageClientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
