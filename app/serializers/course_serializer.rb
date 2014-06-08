class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :url, :location, :num_tas_needed, :credit_hours, :series_id, :start_time, :end_time, :email_sent, :pretty_time, :pretty_date
end
