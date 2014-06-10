App.ApplicationStore = DS.Store.extend();

DS.RESTAdapter.reopen({
  namespace: 'api'
});

App.ApplicationAdapter = DS.ActiveModel.extend({
  namespace: 'api',
  configure: 'plurals',
  course: 'courses'
});
