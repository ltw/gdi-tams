App.TeachingAssistantRoute = Ember.Route.extend({
  model: function(params) {
    return this.get('store').find('teaching_assistant', params.private_id);
  },

  setupController: function(controller, teaching_assistant) {
    controller.set('model', teaching_assistant);
  }
});

// c34a2ba98585129ec9aae6825c23df3f