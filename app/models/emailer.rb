class Emailer < ActionMailer::Base
  
  def contact(recipient,subject,user,sent_at=Time.now)
    @subject = subject
    @recipients = recipient
    @from = user
    @sent_on = sent_at
        @headers = {}
  end

end
