class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :plan

  validates :user, presence: true,  length: { minimum: 4, maximum: 10 }
  validates :telefono, presence: true
  validates :plan_id, presence: true

  def display_name
    user
  end

end
