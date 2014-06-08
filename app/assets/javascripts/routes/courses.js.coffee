App.CoursesRoute = Ember.Route.extend
  model: ->
    @get('store').findAll 'course'