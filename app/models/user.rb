class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :nanoposts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  after_create :set_default_role

  # load feed items
  def feed
    Nanopost.where("user_id = ?", id)
  end

  private

  def set_default_role
    add_role :user
  end
end
