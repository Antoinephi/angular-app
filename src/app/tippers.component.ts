import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-test-cmp',
  templateUrl: './tippers.component.html'
})
export class TippersComponent {

  public tippers;

  constructor(private http: HttpClient) {
    this.tippers = this.http.get('http://tip-spirit-api.cleverapps.io/tippers');
  }

}
