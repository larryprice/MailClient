require 'test/unit'
require 'flexmock/test_unit'

require 'date'
require_relative '../lib/mail'

 class TC_Mail < Test::Unit::TestCase
  TEST_SENDER = :SENDER
  TEST_SUBJECT = :SUBJECT
  TEST_MESSAGE = :MESSAGE
  TEST_REPLY_TO = :REPLY_TO
  TEST_TIME_SENT = DateTime.now

  def setup
    @mail = Mail.new(TEST_SENDER, TEST_SUBJECT, TEST_MESSAGE,
      TEST_REPLY_TO, TEST_TIME_SENT)
  end

  def teardown
  end

  def test_mail_class_exists
    assert_not_nil @mail
  end

  def test_mail_can_get_sender
    begin
      @mail.get_sender
    rescue NoMethodError => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_constructor_sets_sender
    assert_equal TEST_SENDER, @mail.get_sender
  end

  def test_mail_can_get_subject
    begin
      @mail.get_subject
    rescue NoMethodError => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_constructor_sets_subject
    assert_equal TEST_SUBJECT, @mail.get_subject
  end

  def test_mail_can_get_message
    begin
      @mail.get_message
    rescue NoMethodError => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_constructor_sets_message
    assert_equal TEST_MESSAGE, @mail.get_message
  end

  def test_mail_can_get_reply_to
    begin
      @mail.get_reply_to
    rescue NoMethodError => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_constructor_sets_reply_to
    assert_equal TEST_REPLY_TO, @mail.get_reply_to
  end

  def test_mail_can_get_time_sent
    begin
      @mail.get_time_sent
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_constructor_sets_time_sent
    assert_equal TEST_TIME_SENT, @mail.get_time_sent
  end

  def test_mail_can_get_time_read
    begin
      @mail.get_time_read
    rescue NoMethodError => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_can_mark_read
    begin
      @mail.mark_read
    rescue NoMethodError => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_set_has_been_read_sets_time_read_to_datetime_now
    @mail.mark_read
    assert_in_delta DateTime.now.to_time, @mail.get_time_read.to_time, 10
  end

  def test_mail_can_get_read
    begin
      @mail.get_read
    rescue NoMethodError => e
      result = e.message
    end

    assert_nil result
  end

  def test_mail_mark_read_sets_get_read
    assert_false @mail.get_read
    @mail.mark_read
    assert @mail.get_read
  end

end