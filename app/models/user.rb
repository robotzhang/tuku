class User < ActiveRecord::Base
  attr_accessible :email, :password, :nickname
end
