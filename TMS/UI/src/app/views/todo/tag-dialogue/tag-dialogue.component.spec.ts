import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TagDialogueComponent } from './tag-dialogue.component';

describe('TagDialogueComponent', () => {
  let component: TagDialogueComponent;
  let fixture: ComponentFixture<TagDialogueComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TagDialogueComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TagDialogueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
