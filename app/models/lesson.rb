class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :section

  validates :name, presence: true
  validates :description, presence: true
  validates :section_id, presence: true

  acts_as_list

  def self.reorder(order_params)
    order_params.each_with_index do |id, index|
      Lesson.find(id).update!(position: index + 1)
    end
  end
end
