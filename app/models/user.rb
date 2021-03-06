class User < ApplicationRecord
  has_many :shops, dependent: :destroy
  has_many :beans, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  has_many :beans_comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :self_introduction, length: { maximum: 500 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :img, ImgUploader

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
