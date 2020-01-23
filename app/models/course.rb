class Course < ApplicationRecord

  belongs_to :teacher

  has_many :discipline_courses
  has_many :disciplines, through: :discipline_courses

  has_many :lessons
  #has_many :sections, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :disciplines, presence: true

end
