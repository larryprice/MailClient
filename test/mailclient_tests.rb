require 'test/unit'
require 'flexmock/test_unit'
require_relative '../lib/mailclient'

 class TC_MailCient < Test::Unit::TestCase
  def setup
    @client = MailClient
  end

  def teardown
  end

  def test_mailclient_class_exists
    assert_not_nil(@client, nil)
  end

  def test_mailclient_should__be_able_to_poll_number_accounts
    begin
      @client.get_num_accounts
    rescue
      result = :threw_exception
    end
    assert_nil(result)
  end

  def test_mailcient_should_have_no_accounts_after_init
    assert_not_nil(@client.get_num_accounts, nil)
  end

  def test_mailcient_should_be_able_to_add_accounts
    begin
      @client.add_account Account.new(:address)
    rescue
      result = :exception_thrown
    end
    assert_nil(result, result.to_s)
  end

  def test_mailcient_adding_account_changes_accounts_size
    @client.add_account Account.new(:address)
    assert_equal(1, @client.get_num_accounts)
  end

  def test_mailcient_should_be_able_to_add_multiple_accounts
    
    [Account.new(:address1), Account.new(:address2), Account.new(:address3)].each do |acct|
      @client.add_account acct
    end

    assert_equal 3, @client.get_num_accounts
  end

  def test_mailcient_can_get_all_account_ids
    begin
      @client.get_account_ids
    rescue
      result = :exception_thrown
    end
    assert_nil result, result.to_s
  end

  def test_mailcient_returns_correct_account_ids
    3.times do |n|
      @client.add_account flexmock("Account", :get_id => n)
    end

    assert_equal 3, (@client.get_account_ids & [0,1,2]).size
  end

  def test_mailcient_can_get_mail
    begin
      @client.get_mail
    rescue Exception => e
      result = e.message
    end
    assert_nil result, result
  end

  def test_mailcient_can_get_mail_for_individual_accounts
    begin
      @client.get_mail :id
    rescue Exception => e
      result = e.message
    end
    assert_nil result, result
  end

  def test_mailcient_get_mail_calls_get_mail_on_all_accounts
    3.times do |n|
      account = flexmock("Account", :get_id => n)
      account.should_receive(:get_mail).once.and_return(nil)
      @client.add_account account
    end
    @client.get_mail

    begin
      flexmock_verify()
    rescue Exception => e
      result = e.message
    end
    assert_nil result, result
  end

  def test_mailcient_can_remove_accounts
    account = flexmock("Account", :get_id => :id)
    @client.add_account(account)
    begin
      @client.remove_account account.get_id
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_mailcient_removes_specified_accounts
    account = flexmock("Account", :get_id => :id)
    @client.add_account(account)
    @client.remove_account(account.get_id)
    assert_false @client.get_account_ids.include?(account.get_id)
  end

  def test_mailcient_returns_error_when_account_id_not_found
    assert_equal :ACCOUNT_DNE_ERROR, @client.remove_account(:id)
  end

end