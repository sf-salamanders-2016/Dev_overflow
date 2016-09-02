require_relative 'votable_module'

class Question < ActiveRecord::Base
  include Votable

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

end
