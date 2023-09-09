import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FieldPossibleValuesDialogComponent } from './field-possible-values-dialog.component';

describe('FieldPossibleValuesDialogComponent', () => {
  let component: FieldPossibleValuesDialogComponent;
  let fixture: ComponentFixture<FieldPossibleValuesDialogComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FieldPossibleValuesDialogComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FieldPossibleValuesDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
