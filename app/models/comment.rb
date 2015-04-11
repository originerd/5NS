class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :nanopost

  validates :user_id, presence: true
  validates :nanopost_id, presence: true
  validates :content, presence: true
  validate  :check_content

  before_save :squeeze_content

  private

  # validation

  # content size validation (5 characters)
  def check_content
    unless content.delete("?! ").size == 5
      errors.add(:content, "는 다섯 글자로만 작성할 수 있습니다.")
    end
  end

  # before save filter

  # Squeeze '!? '
  def squeeze_content
    content.gsub!(/[?! ]{2,}/) { |match| match.split('').uniq.join }
    content.strip!
  end
end
