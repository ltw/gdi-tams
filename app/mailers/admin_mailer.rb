class AdminMailer < ActionMailer::Base
  include Resque::Mailer

  default to: Proc.new { Admin.pluck(:email) },
          from: '"Liz at GDI Chicago" <liza@girldevelopit.com>'

  layout 'mailer'

  def new_ta(ta, screeners)
    @ta = ta
    @about = CGI.escapeHTML(screeners[:about]) || 'Answer not provided.'
    @how = CGI.escapeHTML(screeners[:how]) || 'Answer not provided.'
    @why = CGI.escapeHTML(screeners[:why]) || 'Answer not provided.'
    mail(subject: "GDI Chicago: New TA application received")
  end
end
