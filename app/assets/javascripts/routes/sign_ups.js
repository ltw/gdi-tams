App.SignUpsRoute = Ember.Route.extend({
  model: function() {
    this.get('store').findAll('course');
  }
});
