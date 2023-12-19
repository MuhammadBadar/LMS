import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageBranchschoolComponent } from './manage-branchschool.component';

describe('ManageBranchschoolComponent', () => {
  let component: ManageBranchschoolComponent;
  let fixture: ComponentFixture<ManageBranchschoolComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageBranchschoolComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageBranchschoolComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
