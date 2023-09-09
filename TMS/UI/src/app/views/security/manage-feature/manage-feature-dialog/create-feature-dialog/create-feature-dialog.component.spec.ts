import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateFeatureDialogComponent } from './create-feature-dialog.component';

describe('CreateFeatureDialogComponent', () => {
  let component: CreateFeatureDialogComponent;
  let fixture: ComponentFixture<CreateFeatureDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CreateFeatureDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateFeatureDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
