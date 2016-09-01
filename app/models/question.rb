class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable


  def count_up_votes
    all_votes = self.votes
    upvotes = all_votes.select do |vote|
      vote.upvoted? == true
    end
    upvotes.count
  end

    def count_down_votes
    all_votes = self.votes
    upvotes = all_votes.select do |vote|
      vote.upvoted? == false
    end
    upvotes.count
  end

end
