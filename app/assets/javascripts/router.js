App.Router.map(function() {
  this.resource('courses', { path: '/dashboard' });
});

App.ApplicationRoute = Ember.Route.extend({
  actions: {
    openModal: function(modalName, model) {
      this.controllerFor(modalName).set('model', model);
      console.log("click");
      return this.render(modalName, {
        into: 'application',
        outlet: 'modal'
      });
    },

    closeModal: function() {
      return this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      });
    }
  }
});
