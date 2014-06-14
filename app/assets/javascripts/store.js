App.ApplicationStore = DS.Store.extend();

DS.RESTAdapter.reopen({
  namespace: 'api'
});

App.ApplicationSerializer = DS.ActiveModelSerializer.extend({});
