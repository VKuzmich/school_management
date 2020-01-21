class Course < ApplicationRecord

  belongs_to :teacher

  has_many :discipline_courses, dependent: :destroy
  has_many :disciplines, through: :discipline_courses

  has_many :lessons, dependent: :restrict_with_error
  has_many :sections, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :disciplines, presence: true

end
