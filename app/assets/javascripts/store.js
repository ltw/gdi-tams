App.ApplicationStore = DS.Store.extend();

DS.RESTAdapter.reopen({
  namespace: 'api'
});

# Check if the ActiveModelSerializer adapter works here
App.ApplicationAdapter = DS.RESTAdapter.extend({
  namespace: 'api',
  configure: 'plurals',
  course: 'courses'
});
