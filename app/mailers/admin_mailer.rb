class AdminMailer < ActionMailer::Base
  include Resque::Mailer

  default to: Proc.new { Admin.pluck(:email) },
          from: '"Liz at GDI Chicago" <liza@girldevelopit.com>'

  layout 'mailer'

  def new_ta(ta)
    @ta = ta
    mail(subject: "GDI Chicago: New TA application received")
  end
end
