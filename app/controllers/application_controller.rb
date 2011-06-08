require "application_responder"

class ApplicationController < ActionController::Base

  before_filter :set_account

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery
  def set_account
    @active_account = Account.find(session[:account_id]) unless session[:account_id].blank?
  end

  def authenticate_account
    if @active_account.blank?
      redirect_to sign_in_path
      return false
    end
  end

  def hide_header
    @header = false
  end

  def hide_footer
    @footer = false
  end
end
