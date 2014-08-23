class Student < ActiveRecord::Base
  has_many :records
  has_many :meetings, through: :records
  validates :name, presence: true
end
