import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-pricing',
  templateUrl: './app-pricing.component.html',
  styleUrls: [
    './app-pricing.component.css'
  ]
})
export class AppPricingComponent implements OnInit {

  editorData = `<h1>Egret | Angular material admin</h1>
  <p><a href="http://devegret.com" target="_blank"><strong>DevEgret</strong></a></p>
  <p><br></p><p><strong >Lorem Ipsum</strong>
  <span>&nbsp;is simply dummy text of the printing and typesetting industry. 
  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a 
  galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</span></p>`;

  constructor() { }

  ngOnInit() {
  }
  onClick() {
    console.log("click is trigerd")

  }

  onContentChanged() { }
  onSelectionChanged() { }
}
