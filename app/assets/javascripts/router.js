App.Router.map(function() {
  this.resource('courses', { path: '/dashboard' });
  this.resource('sign_ups', { path: '/sign_ups/:private_id' });
});
