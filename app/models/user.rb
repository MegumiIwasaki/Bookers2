class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  validates :name, presence: true, length: {minimum: 2, maximum: 20}

  #with_options unless: @current_user.nil? do
     validates :introduction, length: {maximum: 50}
  #end

end
