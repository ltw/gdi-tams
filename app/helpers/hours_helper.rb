module HoursHelper
  def build_series_hours(series, ta)
    courses = series.courses.reject { |c| c.id == params[:course_id] }
    course.each do |course|
      hour = Hour.new(course: course, teaching_assistant: ta)
      object = build_hour_from(hour)
      object.save
    end
  end

  def build_hour_from(hour)
    if !hour.teaching_assistant.approved?
      hour.num = 0
    else
      hour.num = hour.course.credit_hours
    end
  end
end