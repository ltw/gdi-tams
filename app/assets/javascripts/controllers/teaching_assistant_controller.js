App.TeachingAssistantController = Ember.ObjectController.extend({
  upcoming: function() {
    var courses = this.store.findAll('course');
    debugger
    "hello"
  }.property()
});