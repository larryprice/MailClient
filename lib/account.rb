require 'net/imap'
require 'thread'

class Account
  def initialize(address)
    @address = address
    @id = address
    @reply_to = address
  end

  # ID is the Account ID the user has associated with the account
  # Defaults to Account email address if nil
  def get_id
    @id
  end
  def set_id(id)
    @id = id
  end

  # Email address associated with this account
  # Required in constructor
  def get_address
    @address
  end
  def set_address(address)
    @address = address
  end

  # Name used on this account
  def get_name
    @name
  end
  def set_name(name)
    @name = name
  end

  # Reply-To address associated with this account
  # Defaults to address
  def get_reply_to
    @reply_to
  end
  def set_reply_to(reply_to)
    @reply_to = reply_to
  end

  # Outgoing server address associated with this account
  def get_outgoing_server
    @outgoing_server
  end
  def set_outgoing_server(outgoing_server)
    @outgoing_server = outgoing_server
  end

  # Incoming server address associated with this account
  def get_incoming_server
    @incoming_server
  end
  def set_incoming_server(incoming_server)
    @incoming_server = incoming_server
  end

  # invokes a get on the mail server to check for differences
  def get_mail
    
  end

  def connect
    if !@incoming_server.nil?
      @incoming_server.connect
    else
      :SERVER_NIL_ERROR
    end
  end

  # time to wait for server before stopping request
  def get_connect_timeout
    @connect_timeout
  end
  def set_connect_timeout(timeout_in_seconds)
    @connect_timeout = timeout_in_seconds.to_i
  end

  def login
    if !@incoming_server.nil?
      @incoming_server.login
    else
      :SERVER_NIL_ERROR
    end
  end

  def is_connected?
    if !@incoming_server.nil?
      @incoming_server.is_connected?
    else
      :SERVER_NIL_ERROR
    end
  end
end
