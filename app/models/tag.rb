class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :description, presence: true
end
