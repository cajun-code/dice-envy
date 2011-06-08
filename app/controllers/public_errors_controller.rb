class PublicErrorsController < ApplicationController

  def internal_server_error
    @title = "503"
  end

  def not_found
    @title = "404"
  end

  def unprocessable_entity

  end

  def conflict

  end

  def method_not_allowed

  end

  def not_implemented

  end

end