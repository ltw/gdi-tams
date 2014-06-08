TeachingAssistants.Store = DS.Store.extend({
  namespace: 'api'
});

// // Override the default adapter with the `DS.ActiveModelAdapter` which
// // is built to work nicely with the ActiveModel::Serializers gem.
TeachingAssistants.ApplicationAdapter = DS.ActiveModelAdapter.extend({

});
