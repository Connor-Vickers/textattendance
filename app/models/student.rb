class Student < ActiveRecord::Base
  has_many :records
  has_many :meetings, through: :records
  belongs_to :course
  validates :name, :course_id, presence: true
end
