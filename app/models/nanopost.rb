class Nanopost < ActiveRecord::Base
  resourcify
  include Authority::Abilities

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validate  :check_content

  private

  # validation

  # content size validation (5 characters)
  def check_content
    unless content.delete("?!").size == 5
      errors.add(:content, "다섯 글자로만 작성할 수 있습니다.")
    end
  end
end
