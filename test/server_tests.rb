require 'test/unit'
require_relative '../lib/server'

class TC_MailCient < Test::Unit::TestCase
  def setup
     @server = Server.new
  end

  def teardown
  end

  def test_can_create_server
    begin
      server = Server.new
    rescue Exception => e
      result = e.message
    end
    
    assert_nil result, result
  end

  def test_server_can_get_name
    begin
      @server.get_name
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_name
    begin
      @server.set_name(:name)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_name_sets_name
    @server.set_name(:name)
    assert_equal :name, @server.get_name
  end

  def test_server_can_get_description
    begin
      @server.get_description
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_description
    begin
      @server.set_description(:description)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_description_sets_description
    @server.set_description(:description)
    assert_equal :description, @server.get_description
  end

  def test_server_can_get_port_number
    begin
      @server.get_port_number
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_port_number
    begin
      @server.set_port_number(:port)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_port_number_sets_port_number
    @server.set_port_number(:port_number)
    assert_equal :port_number, @server.get_port_number
  end

  def test_server_can_get_username
    begin
      @server.get_username
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_username
    begin
      @server.set_username(:username)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_username_sets_username
    @server.set_username(:username)
    assert_equal :username, @server.get_username
  end

  def test_server_can_get_authentication_method
    begin
      @server.get_authentication_method
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_authentication_method
    begin
      @server.set_authentication_method(:method)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_authentication_method_sets_authentication_method
    @server.set_authentication_method(:Normal_Password)
    assert_equal @server.humanize_enum(:Normal_Password),
      @server.get_authentication_method
  end

  def test_server_set_authentication_only_accepts_valid_authentication_methods
    assert_not_equal :method,
      @server.set_authentication_method(:method)
  end

  def test_server_set_authentication_does_not_set_invalid_authentication_method
    @server.set_authentication_method(:method)
    assert_not_equal :method, @server.get_authentication_method
  end

  def test_server_get_authentication_method_returns_humanized_string
    @server.set_authentication_method(:Kerberos_AND_GSSAPI)
    assert_equal @server.humanize_enum(:Kerberos_AND_GSSAPI),
      @server.get_authentication_method
  end

  def test_server_can_get_connection_security_type
    begin
      @server.get_connection_security_type
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_connection_security_type
    begin
      @server.set_connection_security_type(:connection)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_connection_security_type_sets_connection_security_type
    @server.set_connection_security_type(:None)
    assert_equal @server.humanize_enum(:None),
      @server.get_connection_security_type
  end

  def test_server_set_security_does_not_set_invalid_security_type
    assert_not_equal :connection,
      @server.set_connection_security_type(:connection)
  end

  def test_server_get_security_type_returns_humanized_string
    @server.set_connection_security_type(:SSL_AND_TLS)
    assert_equal @server.humanize_enum(:SSL_AND_TLS),
      @server.get_connection_security_type
  end

  def test_server_humanize_string_replaces_underscores_with_spaces
    assert_equal "Lorem ipsum dolor sit amet",
      @server.humanize_enum(:Lorem_ipsum_dolor_sit_amet)
  end

  def test_server_humanize_string_replaces_and_keyword_with_back_slash
    assert_equal "Me/You/The Bottle",
      @server.humanize_enum(:Me_AND_You_AND_The_Bottle)
  end

  def test_server_can_get_server_type
    begin
      @server.get_type
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_server_type
    begin
      @server.set_type(:type)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_type_sets_server_type
    @server.set_type(:IMAP)
    assert_equal :IMAP, @server.get_type
  end
  
  def test_server_set_type_does_not_set_invalid_server_type
    @server.set_type(:type)
    assert_not_equal :type, @server.get_type
  end

  def test_server_can_get_password
    begin
      @server.get_password
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_can_set_password
    begin
      @server.set_password(:password)
    rescue Exception => e
      result = e.message
    end

    assert_nil result, result
  end

  def test_server_set_password_sets_password
    @server.set_password(:password)
    assert_equal :password, @server.get_password
  end

end
