App.CoursesRoute = Ember.Route.extend({
  model: function() {
    return this.get('store').findAll('course');
  }
});
