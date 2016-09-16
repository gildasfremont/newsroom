App.topics = App.cable.subscriptions.create('TopicsChannel', {
  received: function(data) {
    // $("#messages").removeClass('hidden')
    return $('.topic-list').prepend(this.renderTopic(data));
    console.log("salut -----------");
  },

  renderTopic: function(data) {
    return "<div class='topic'>" + data.topic + "</div>";
  }
});
