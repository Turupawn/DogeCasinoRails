class User < ActiveRecord::Base
  has_many :chests
	has_many :withdraws
end
