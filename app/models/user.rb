class User < ApplicationRecord
  has_many :shops, dependent: :destroy
  has_many :beans, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :img, ImgUploader
end
