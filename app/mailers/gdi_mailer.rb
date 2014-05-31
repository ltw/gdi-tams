class GdiMailer < ActionMailer::Base
  default from: 'liza@girldevelopit.com'
  layout 'mailer'

  def welcome(ta)
    @ta = ta
    @sign_up_url = "http://gdichicago.herokuapp.com/sign_ups/#{@ta.private_id}"
    mail(to: @ta.email, subject: "GDI Chicago: Your TA application is approved!")
  end

  def pending(ta)
    @ta = ta
    mail(to: @ta.email, subject: "GDI Chicago: Application received")
  end

  def monthly(ta, courses, month)
    @ta = ta
    @courses = courses
    @month = month
    @sign_up_url = "http://gdichicago.herokuapp.com/sign_ups/#{@ta.private_id}"
    mail(to: @ta.email, subject: "GDI Chicago: Monthly TA sign ups - #{month}!")
  end
end
