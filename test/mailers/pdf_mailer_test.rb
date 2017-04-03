require 'test_helper'

class PdfMailerTest < ActionMailer::TestCase
  test "pdf_mailer" do
    mail = PdfMailer.pdf_mailer
    assert_equal "Pdf mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
