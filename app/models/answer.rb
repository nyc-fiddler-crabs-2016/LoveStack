class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :responses, as: :responsible
  has_many :votes, as: :voteable

  validates :content, :user, :question, presence: true

  def vote_count
    self.votes.where(vote_status:true).length - self.votes.where(vote_status:false).length
  end

end
