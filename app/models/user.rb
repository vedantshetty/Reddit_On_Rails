class User < ApplicationRecord
	VALID_USERNAME_REGEX= /\A\S*\z/
	VALID_PASSWORD_REGEX = /\S*[`!@#$%^&*()]+\S*/
	VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	has_secure_password
	validates :username, presence: true, format: {with: VALID_USERNAME_REGEX}, uniqueness: true, length: {maximum: 250}
	validates :password_digest, length: {in: 8..250}, format: {with: VALID_PASSWORD_REGEX}, presence: true
	validates :email, format: {with: VALID_EMAIL_REGEX}


	has_many :posts
	has_many :comments
end
