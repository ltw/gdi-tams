App.ApplicationStore = DS.Store.extend()

DS.RESTAdapter.reopen
  namespace: 'api'

App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api'
  configure: 'plurals', course: 'courses'


# App.ApplicationStore = DS.Store.extend
#   adapter: DS.RESTAdapter.create()
