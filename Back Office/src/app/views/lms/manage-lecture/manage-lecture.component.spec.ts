import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageLectureComponent } from './manage-lecture.component';

describe('ManageLectureComponent', () => {
  let component: ManageLectureComponent;
  let fixture: ComponentFixture<ManageLectureComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageLectureComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageLectureComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
