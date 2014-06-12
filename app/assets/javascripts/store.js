App.ApplicationStore = DS.Store.extend();

DS.RESTAdapter.reopen({
  namespace: 'api'
});
