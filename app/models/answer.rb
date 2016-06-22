class Answer < ActiveRecord::Base
  has_many    :comments, as: :commentable
  has_many    :votes, as: :votable
  belongs_to  :responder, class_name: 'User'
  belongs_to  :post
  has_one     :poster, { through: :post, source: :poster }

  validates   :body, presence: true
  validates   :best_answer, uniqueness: { scope: :post }
end