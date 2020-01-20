class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :rememberable,  :trackable, :validatable
end
