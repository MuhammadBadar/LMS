import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageVocabularyComponent } from './manage-vocabulary.component';

describe('ManageVocabularyComponent', () => {
  let component: ManageVocabularyComponent;
  let fixture: ComponentFixture<ManageVocabularyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageVocabularyComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageVocabularyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
