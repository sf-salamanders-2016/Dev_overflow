require 'bcrypt'

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    puts "helllllo i'm a password hash"
    self.password_hash = @password
  end
end
