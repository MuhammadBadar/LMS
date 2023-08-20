import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageUserattbydateComponent } from './manage-userattbydate.component';

describe('ManageUserattbydateComponent', () => {
  let component: ManageUserattbydateComponent;
  let fixture: ComponentFixture<ManageUserattbydateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageUserattbydateComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageUserattbydateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
