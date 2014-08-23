class Meeting < ActiveRecord::Base
  has_many :records
  has_many :students, through: :records
  belongs_to :course
  validates :when, :name, :course_id, presence: true
end
