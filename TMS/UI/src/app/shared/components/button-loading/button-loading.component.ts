import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'button-loading',
  templateUrl: './button-loading.component.html',
  styleUrls: ['./button-loading.component.scss']
})
export class ButtonLoadingComponent implements OnInit {

  @Input('loading') loading: boolean;
  @Input('btnClass') btnClass: string;
  @Input('raised') raised: boolean = true;
  @Input('loadingText') loadingText = 'Please wait';
  @Input('type') type: 'button' | 'submit' = 'submit';
  @Input('color') color: 'primary' | 'accent' | 'warn';

  constructor() { 
  }

  ngOnInit() {
  }

}
