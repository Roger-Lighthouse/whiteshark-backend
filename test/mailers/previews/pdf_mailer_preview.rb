# Preview all emails at http://localhost:3000/rails/mailers/pdf_mailer
class PdfMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pdf_mailer/pdf_mailer
  def pdf_mailer
    job=Job.last
    PdfMailer.pdf_mailer(job)
  end

end
