#

class Server
  @@AuthenticationMethods = [:Normal_Password, :Encrypted_Password,
    :Kerberos_AND_GSSAPI, :NTLM, :TLS_Certificate]
  @@ConnectionSecurityTypes = [:None, :STARTTLS, :SSL_AND_TLS]
  @@ServerTypes = [:POP3, :IMAP]
  
  def initialize
    
  end

  # Name used to identify this server
  def get_name
    @name
  end
  def set_name(name)
    @name = name
  end

  # Description for this server
  def get_description
    @description
  end
  def set_description(description)
    @description = description
  end

  # Port number for this server
  def get_port_number
    @port_number
  end
  def set_port_number(port_number)
    @port_number = port_number
  end

  # Username used to log in to this server
  def get_username
    @username
  end
  def set_username(username)
    @username = username
  end

  # Authentication method to use to access this server
  def get_authentication_method
    humanize_enum @authentication_method
  end
  def set_authentication_method(method)
    if @@AuthenticationMethods.include? method
      @authentication_method = method
    end
  end

  # Connection Security Type to use while accessing the server
  def get_connection_security_type
    humanize_enum @connection_security_type
  end
  def set_connection_security_type(connection_security_type)
    if @@ConnectionSecurityTypes.include? connection_security_type
      @connection_security_type = connection_security_type
    end
  end

  def humanize_enum(enum)
    if enum != nil
      enum_string = enum.to_s
      if enum_string.match(/AND/)
        enum_string.gsub(/_AND_/, '/').gsub(/_/, ' ')
      else
        enum_string.gsub(/_/, ' ')
      end
    end
  end

  # Server Type: POP3 or IMAP
  def get_type
    @type
  end
  def set_type(type)
    if @@ServerTypes.include? type
      @type = type
    end
  end

  # User password
  def get_password
    @password
  end
  def set_password(password)
    @password = password
  end
end
