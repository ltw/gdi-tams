module HoursHelper
  def build_series_hours(series, ta)
    courses = series.courses.reject { |c| c.id == params[:course_id] }
    courses.each do |course|
      if course.date > Date.today
        hour = Hour.new(course: course, teaching_assistant: ta)
        build_hour_from(hour)
      end
    end
  end

  def build_hour_from(hour)
    if !hour.teaching_assistant.approved?
      hour.num = 0
    else
      hour.num = hour.course.credit_hours
    end
    hour.save
  end
end