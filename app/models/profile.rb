class Profile < ActiveRecord::Base
  attr_accessible :avatar, :biography, :birthDate, :firstName, :lastName
end
