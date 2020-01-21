class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :section

  validates :name, presence: true
  validates :section_id, presence: true

  def previous
    return if position == 1

    course.lessons.find_by(position: position - 1)
  end

  def next
    course.lessons.find_by(position: position + 1)
  end
end
