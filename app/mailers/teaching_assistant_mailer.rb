class TeachingAssistantMailer < ActionMailer::Base
  include Resque::Mailer

  default from: '"Liz at GDI Chicago" <liza@girldevelopit.com>'
  layout 'mailer'

  def kick_off(ta, courses)
    @ta = ta
    mail(to: @ta['email'], subject: "TA signups and credit hours! Details inside")
  end

  def welcome(ta)
    @ta = ta
    mail(to: @ta['email'], subject: "GDI Chicago: Your TA application is approved!")
  end

  def pending(ta)
    @ta = ta
    mail(to: @ta['email'], subject: "GDI Chicago: Application received")
  end

  def monthly(ta, courses, month)
    @ta = ta
    @courses = courses
    mail(to: @ta['email'], subject: "GDI Chicago: Monthly TA sign ups - #{month}!")
  end

  def confirmation(ta, course)
    @ta = ta
    @course = course
    mail(to: @ta['email'], subject: "TA Confirmation: #{course['name']}")
  end

  def forgot(ta)
    @ta = ta
    mail(to: @ta['email'], subject: "Here's your private sign up page")
  end
end
