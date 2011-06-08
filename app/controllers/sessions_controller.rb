class SessionsController < ApplicationController

  before_filter :hide_header
  before_filter :hide_footer

  def create
    email = params[:email]
    password = params[:password]

    account = Account.authenticate email, password

    unless account.nil?
      session[:account_id] = account.id.to_s
      notice = { header: "Signing In...", message: "Thanks for comming back. The Tapplings missed you!" }
      redirect_to root_url, notice: notice
    else
      flash.now.alert = { header: "Oops!", message: "Invalid email or password." }
      render :new
    end

  end

  def destroy
    if @active_account.present?
      @active_account.last_action = nil
      @active_account.save!
    end
    session[:account_id] = nil
    notice = { header: "Signing Out...", message: "We hope to see you again later!" }
    redirect_to root_url, notice: notice
  end

end
