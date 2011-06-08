class PagesController < ApplicationController
  def support
    @title = 'Support'
  end

  def policy
    @title = 'Policy'
  end

  def terms
    @title = 'Terms'
  end

  def jobs
    @title = 'Jobs'
  end

  def about
    @title = 'About'
  end

  def contact
    @title = 'Contact'
  end

end
