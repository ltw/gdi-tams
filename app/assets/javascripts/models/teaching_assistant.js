App.TeachingAssistant = DS.Model.extend({
  courses: DS.hasMany('course'),

  email: DS.attr('string'),
  name: DS.attr('string'),
  private_id: DS.attr('string'),
  status: DS.attr('string')
});