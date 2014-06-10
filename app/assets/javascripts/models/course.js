App.Course = DS.Model.extend({
  name: DS.attr('string'),
  date: DS.attr('date'),
  url: DS.attr('string'),
  location: DS.attr('string'),
  num_tas_needed: DS.attr('number'),
  credit_hours: DS.attr('number'),
  start_time: DS.attr('date'),
  end_time: DS.attr('date'),
  email_sent: DS.attr('boolean'),
  pretty_time: DS.attr('string'),
  pretty_date: DS.attr('string')
});
