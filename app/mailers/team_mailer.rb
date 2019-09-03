# frozen_string_literal: true

class TeamMailer < ApplicationMailer
  def send_report
    @teams = Team.all

    mail(
      to: 'some_email_address@gmail.com',
      bcc: '',
      subject: 'Teams'
    )
  end
end
