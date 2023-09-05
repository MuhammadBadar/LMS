import { Component } from '@angular/core';
import { UserAccountVM } from '../../lms/Models/UserAccountVM';




@Component({
  selector: 'app-manage-useraccount',
  templateUrl: './manage-useraccount.component.html',
  styleUrls: ['./manage-useraccount.component.css']
})
export class ManageUseraccountComponent {
  Add: boolean = true;
  Edit: boolean = false;

  selectedUserAccount: UserAccountVM
}
