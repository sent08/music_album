class User < ActiveRecord::Base

  acts_as_authentic
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :display_name

  #Validations
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :display_name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email,
    :with => %r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i,
    :message => "is not a valid email address.",
    :if => Proc.new {|u| not u.email.blank?}
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates_confirmation_of :password

  #Associations
  has_many :albums, :dependent => :destroy

end
