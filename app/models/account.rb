class Account < ActiveRecord::Base
  attr_accessible :email, :password, :profile, :username
  
  validates :username, :password, :email, :presence => true
  validates :username, :length => { :minimum => 3 }
  validates :password, :length => { :minimum => 6 }
  validates :username, :uniqueness => true
  validates :email, :uniqueness => { :message => "is already being used." }
end
