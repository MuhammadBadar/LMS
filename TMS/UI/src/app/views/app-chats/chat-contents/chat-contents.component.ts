import { Component, OnInit, ViewChild, ViewChildren, Input, OnDestroy, ChangeDetectorRef } from "@angular/core";
import { PerfectScrollbarDirective } from "ngx-perfect-scrollbar";
import { ChatService, ChatCollection, User, Chat } from "../chat.service";
import { NgForm } from "@angular/forms";
import { Subscription } from 'rxjs';

@Component({
  selector: "app-chat-contents",
  templateUrl: "./chat-contents.component.html",
  styleUrls: ["./chat-contents.component.scss"]
})
export class ChatContentsComponent implements OnInit, OnDestroy {
  public user: User = new User();
  public activeContact: User = new User();
  public chatCollection: ChatCollection;

  userUpdateSub: Subscription;
  chatUpdateSub: Subscription;
  chatSelectSub: Subscription;

  @Input('matSidenav') matSidenav;
  @ViewChild(PerfectScrollbarDirective) psContainer: PerfectScrollbarDirective;

  @ViewChildren("msgInput") msgInput;
  @ViewChild("msgForm") msgForm: NgForm;

  constructor(
    public chatService: ChatService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit() {
    // Listen for user update
    this.userUpdateSub = this.chatService.onUserUpdated.subscribe(user => {
      this.user = user;
      this.cdr.markForCheck();
    });

    // Listen for contact change
    this.chatSelectSub = this.chatService.onChatSelected.subscribe(res => {
      if (res) {
        this.chatCollection = res.chatCollection;
        this.activeContact = res.contact;
        this.initMsgForm();
        this.cdr.markForCheck();
      }
    });

    // Listen for chat update
    this.chatUpdateSub = this.chatService.onChatsUpdated.subscribe(chat => {
      this.chatCollection.chats.push(chat);
      this.scrollToBottom();

      this.cdr.markForCheck();
    })
  }
  
  ngOnDestroy() {
    if( this.userUpdateSub ) this.userUpdateSub.unsubscribe();
    if( this.chatSelectSub ) this.chatSelectSub.unsubscribe();
    if( this.chatUpdateSub ) this.chatUpdateSub.unsubscribe();
  }

  sendMessage(e) {
    // console.log(this.msgForm.form.value.message)
    if(!this.msgForm.form.value.message || !this.msgForm.form.value.message.trim().length) {
      return;
    }
    const chat: Chat = {
      contactId: this.chatService.user.id,
      text: this.msgForm.form.value.message,
      time: new Date().toISOString()
    };

    this.chatCollection.chats.push(chat);
    this.chatService
      .updateChats(this.chatCollection.id, [...this.chatCollection.chats])
      .subscribe(res => {
        this.initMsgForm();
        this.cdr.markForCheck();
      });
    
    // Only for demo purpose
    this.chatService.autoReply({
      contactId: this.activeContact.id,
      text: `Hi, I\'m ${this.activeContact.name}. Your imaginary friend.`,
      time: new Date().toISOString()
    })
    
  }

  initMsgForm() {
    setTimeout(() => {
      this.msgForm && this.msgForm.reset();
      this.msgInput && this.msgInput.first && this.msgInput.first.nativeElement.focus();
      this.scrollToBottom();
    });
  }

  scrollToBottom() {
    setTimeout(() => {
      this.psContainer && this.psContainer.update();
      this.psContainer && this.psContainer.scrollToBottom(0, 400);
    })
  }
}
