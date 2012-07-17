require 'test/unit'
require_relative '../lib/account'

class TC_MailCient < Test::Unit::TestCase
  def setup
    @account = Account.new(:id)
  end

  def teardown
  end

  def test_can_create_account
    begin
      account = Account.new :id
    rescue Exception => e
      result = e.message
    end
    assert_nil result, result
  end

  def test_account_has_id
    begin
      @account.get_id
    rescue Exception => e
      result = e.message
    end
    assert_nil result, result
  end

  def test_account_can_set_id
    begin
      @account.set_id :id
    rescue Exception => e
      result = e.message
    end
    assert_nil result, result
  end

  def test_account_id_set_is_equal_to_id_get
    @account.set_id :id
    assert_equal :id, @account.get_id, "Set ID does not match ID from get_id"
  end

  def test_account_can_set_id_in_initialization
    
    account = Account.new :id
    assert_equal :id, account.get_id, "Set ID in initialization does not match ID from get_id"
  end

  def test_account_can_get_mail
    begin
      @account.get_mail
    rescue Exception => e
      result = e.message
    end
    assert_nil result, result
  end

end
