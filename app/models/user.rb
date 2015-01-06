class User < ActiveRecord::Base
	has_secure_password
	validates :username, length: {in: 6..20}, presence: true
	validates :password, length: {in: 6..20}, presence: true
	validates :email, format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, presence: true
end
