class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :nanopost
  validates :user, presence: true
  validates :nanopost, presence: true
end
