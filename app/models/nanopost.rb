class Nanopost < ActiveRecord::Base
  resourcify
  include Authority::Abilities

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true
  validate  :check_content
  validate  :picture_size

  before_save :squeeze_content

  private

  # validation

  # content size validation (5 characters)
  def check_content
    unless content.delete("?! ").size == 5
      errors.add(:content, "다섯 글자로만 작성할 수 있습니다.")
    end
  end

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "5메가바이트 이하의 사진만 올릴 수 있습니다.")
    end
  end

  # before save filter

  # Squeeze '!? '
  def squeeze_content
    content.gsub!(/[?! ]{2,}/) { |match| match.split('').uniq.join }
    content.chomp!
  end
end
