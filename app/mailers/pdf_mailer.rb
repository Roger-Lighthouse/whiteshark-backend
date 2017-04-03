class PdfMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pdf_mailer.pdf_mailer.subject
  #
  def pdf_mailer(job)
    @job = job

    mail to: "roger@whiteshark.ca",
         subject: 'PDF Invoice for #{@job.id}'
  end
end
