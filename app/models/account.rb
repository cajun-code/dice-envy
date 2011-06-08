class Account

  include BCrypt
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Versioning

  max_versions 20

  field :email
  field :password
  field :admin,   :type => Boolean
  field :support, :type => Boolean
  field :banned,  :type => Boolean, :default => false
  field :last_action

  validates_presence_of   :email
  validates_uniqueness_of :email

  validates_presence_of   :password, :on => :create
  validates_length_of     :password, :minimum => 3, :maximum => 256

  before_create :encrypt_password

  def encrypt_password
    self.password = Password.create password
  end

  def self.authenticate email, password
    account = where(email: email).first
    account_password = Password.new(account.password) if account.present?
    if account.present? && account_password.present? && account_password == password
      account
    end
  end

  def first_name
    self.name.split(' ').first
  end

  def last_name
    self.name.split(' ').last
  end

  def signed_in?
    last_action = self.last_action
    last_activity = self.updated_at
    recent = Time.now.utc - 2.hour
    last_action.present? && last_activity >= recent
  end

end
