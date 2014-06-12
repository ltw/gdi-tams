App.TeachingAssistant = DS.Model.extend({
  email: DS.attr('string'),
  name: DS.attr('string'),
  private_id: DS.attr('string'),
  status: DS.attr('string')
});