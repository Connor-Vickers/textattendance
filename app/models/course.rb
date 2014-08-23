class Course < ActiveRecord::Base
  has_many :meetings
  has_many :students
  validates :name, presence: true
end
