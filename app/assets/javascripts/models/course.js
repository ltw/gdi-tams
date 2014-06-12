App.Course = DS.Model.extend({
  teaching_assistants: DS.hasMany('teaching_assistant'),

  can_email: DS.attr('boolean'),
  credit_hours: DS.attr('number'),
  date: DS.attr('date'),
  email_sent: DS.attr('boolean'),
  end_time: DS.attr('date'),
  location: DS.attr('string'),
  name: DS.attr('string'),
  num_tas_needed: DS.attr('number'),
  num_tas_still_needed: DS.attr('number'),
  pretty_date: DS.attr('string'),
  pretty_time: DS.attr('string'),
  series_id: DS.attr('number'),
  start_time: DS.attr('date'),
  url: DS.attr('string'),

  numTas: function() {
    var need = this.get('num_tas_needed');
    var needed = this.get('num_tas_still_needed');
    return need - needed;
  }.property('num_tas_needed', 'num_tas_still_needed'),

  needMoreTas: Ember.computed.gt('num_tas_still_needed', 0)
});
