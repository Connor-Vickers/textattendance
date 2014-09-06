class Course < ActiveRecord::Base
  has_many :meetings, dependent: :destroy
  has_many :students, dependent: :destroy
  validates :name, presence: true
  #accepts_nested_attributes_for :meetings
end
