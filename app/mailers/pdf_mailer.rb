class PdfMailer < ApplicationMailer
  default from: 'roger@whiteshark.ca'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pdf_mailer.pdf_mailer.subject
  #
  def pdf_mailer(job, pdf)
    @job = job
    @greeting = 'HI'


    mail to: "apple@whiteshark.ca",
         subject: 'PDF Invoice for #{@job.id}'
  end
end
