require_relative 'account'

class MailClient
  def initialize()
    @accounts = Hash.new
  end

  def get_num_accounts
    @accounts.keys.size
  end

  def add_account(new_account)
    @accounts[new_account.get_id] = new_account
  end

  def remove_account(id)
    if @accounts.delete(id).nil?
      return :ACCOUNT_DNE_ERROR
    end
  end

  def get_account_ids
    @accounts.keys
  end

  def get_mail(account_id=:all)
    if account_id == :all
      @accounts.keys.each do |id|
        @accounts[id].get_mail
      end
    else
      @accounts[account_id].get_mail if @accounts.has_key?(account_id)
    end
  end
end