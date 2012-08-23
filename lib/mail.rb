class Mail
  def initialize(sender, subject, message, reply_to, time_sent)
    @sender = sender
    @subject = subject
    @message = message
    @reply_to = reply_to
    @time_sent = time_sent
  end

  def get_sender
    @sender
  end

  def get_subject
    @subject
  end

  def get_message
    @message
  end

  def get_reply_to
    @reply_to
  end

  def get_time_sent
    @time_sent
  end

end
