class AccountsController < InheritedResources::Base

  before_filter :authenticate_account, except: [:new, :create]
  before_filter :is_owner?, except: [:new, :create]
  before_filter :hide_header, :only => [:new, :edit]
  before_filter :hide_footer, :only => [:new, :edit]

  def is_owner?
    @account = Account.find params[:id]
    unless (@active_account == @account) || (@active_account.admin?)
      alert = {header: "Bad!", message: "You don't have permission to do that."}
      redirect_to account_path(@account), alert: alert
      return false
    else
      return true
    end
  end

  def create
    account = Account.create! params[:account]
    session[:account_id] = account.id.to_s
    redirect_to root_path
  end

  def update
    account_changes = params[:account]

    account_changes.each do |attribute, value|
      if value.present?
        @account.update_attribute attribute, value
      end
      @account.save!
    end

    notice = {header: "Updated Account", message: "You've successfulyl updated the account!"}
    redirect_to root_path, notice: notice
  end

end
