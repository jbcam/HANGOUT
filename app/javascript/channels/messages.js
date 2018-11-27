App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    user = document.getElementById("current_user").innerHTML;
    document.getElementById("messages").insertAdjacentHTML("beforeend", this.renderMessage(data, user));
    window.scrollTo(0,document.body.scrollHeight);
    return document.getElementById("new_message").reset();
  },

  renderMessage: function(data) {
    if (data.sender == current_user) {
    return `<div class="message-group d-flex justify-content-start align-items-end my-1">
      <img src="${data.avatar}" class="avatar mr-1">
      <div class="message friend p-2">
        ${data.content}
      </div>
    </div>`
    }
    else {
     return `<div class="message-group d-flex justify-content-end align-items-end my-1">
      <div class="message me p-2"> ${data.content} </div>
      <img src="${data.avatar}" class="avatar ml-1">
    </div>`
   }
  }
});
