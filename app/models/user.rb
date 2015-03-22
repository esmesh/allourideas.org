class User < ActiveRecord::Base
  include Clearance::User
  has_many :earls
  has_many :session_infos
  has_many :clicks
  attr_accessible :default
  has_many :user_programming_languages, :class_name => "UserProgrammingLanguages"
  has_many :programming_languages, through: :user_programming_languages
  attr_accessible :default, :department
  before_validation_on_create :set_confirmed_email
  
  def owns?(earl)
    earl.user_id == id
  end
  
  def email_activated=(value)
      self.email_confirmed = value
  end

  def set_confirmed_email
      self.email_activated = true
  end

  def admin?
      self.admin
  end
  
end
