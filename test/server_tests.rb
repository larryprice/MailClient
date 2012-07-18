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

end
