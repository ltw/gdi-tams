class CourseSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes  :id,
              :can_email,
              :credit_hours,
              :date,
              :email_sent,
              :end_time,
              :location,
              :name,
              :num_tas_needed,
              :num_tas_still_needed,
              :pretty_date,
              :pretty_time,
              :series_id,
              :start_time,
              :url

  def can_email
    object.can_email?
  end
end
