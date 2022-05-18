class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable
end
