class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :responses, as: :responsible
  has_many :votes, as: :voteable
  has_many :tag_questions
  has_many :tags, through: :tag_questions

  validates :content, :title, :user, presence: true


  def vote_count
    self.votes.where(vote_status: true).length - self.votes.where(vote_status: false).length
  end
end
