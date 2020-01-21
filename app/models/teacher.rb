class Teacher < ApplicationRecord
  has_many :courses, dependent: :restrict_with_exception

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
end
