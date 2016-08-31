class User < ActiveRecord::Base
  has_many :questions, :answers, :comments, :votes
end
