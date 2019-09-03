class CsvMailer < ApplicationMailer
  def send_report(teams_created, teams_updated)
    @teams_created = teams_created
    @teams_updated = teams_updated
    mail(
        to: 'some_email_address@gmail.com',
        bcc: '',
        subject: 'Teams'
    )
  end
end
