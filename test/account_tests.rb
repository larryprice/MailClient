require 'test/unit'
require 'flexmock/test_unit'
require_relative '../lib/account'

class TC_MailCient < Test::Unit::TestCase
  def setup
    @account = Account.new(:address)
  end

  def teardown
  end

  def test_can_create_account
    begin
      account = Account.new :address
    rescue Exception => e
      result = e.message
    end
    assert_nil result
  end

  def test_account_has_id
    begin
      @account.get_id
    rescue Exception => e
      result = e.message
    end
    assert_nil result
  end

  def test_account_can_set_id
    begin
      @account.set_id :id
    rescue Exception => e
      result = e.message
    end
    assert_nil result
  end

  def test_account_id_set_is_equal_to_id_get
    @account.set_id :id
    assert_equal :id, @account.get_id, "Set ID does not match ID from get_id"
  end

  def test_account_can_set_address_in_initialization
    
    account = Account.new :address
    assert_equal :address, account.get_address,
      "Set ID in initialization does not match ID from get_id"
  end

  def test_account_can_get_mail
    begin
      @account.get_mail
    rescue Exception => e
      result = e.message
    end
    assert_nil result
  end

  def test_account_has_address
    begin
      @account.get_address
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_can_set_address
    begin
      @account.set_address :address
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_set_address_sets_address
    @account.set_address :address
    assert_equal :address, @account.get_address
  end

  def test_account_can_get_name
    begin
      @account.get_name
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_can_set_name
    begin
      @account.set_name :name
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_set_name_sets_address
    @account.set_name :name
    assert_equal :name, @account.get_name
  end

  def test_account_can_get_reply_to_address
    begin
      @account.get_reply_to
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_can_set_reply_to_address
    begin
      @account.set_reply_to(:reply_to)
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_set_reply_to_address_sets_reply_to
    @account.set_reply_to(:reply_to)
    assert_equal :reply_to, @account.get_reply_to
  end

  def test_account_can_get_outgoing_server
    begin
      @account.get_outgoing_server
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_can_set_outgoing_server
    begin
      @account.set_outgoing_server(:outgoing_server)
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_set_outgoing_server_sets_outgoing_server
    @account.set_outgoing_server(:outgoing_server)
    assert_equal :outgoing_server, @account.get_outgoing_server
  end

  def test_account_can_get_incoming_server
    begin
      @account.get_incoming_server
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_can_set_incoming_server
    begin
      @account.set_incoming_server(:incoming_server)
    rescue Exception => e
      result = e.message
    end

    assert_nil result
  end

  def test_account_set_incoming_server_sets_incoming_server
    @account.set_incoming_server(:incoming_server)
    assert_equal :incoming_server, @account.get_incoming_server
  end

  def test_account_can_connect
    server = flexmock("Server", :connect => nil)
    @account.set_incoming_server server

    begin
      @account.connect
    rescue Exception => e
      result = e.message
    end
    
    assert_nil result
  end

  def test_account_calls_connect_on_server
    server = flexmock("Server")
    server.should_receive(:connect).once.and_return(nil)
    @account.set_incoming_server server

    @account.connect
    begin
      flexmock_verify()
    rescue Exception => e
      result = e.message
    end
    assert_nil result
  end

end
