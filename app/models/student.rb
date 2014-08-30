class Student < ActiveRecord::Base
  has_many :records, dependent: :destroy
  has_many :meetings, through: :records
  belongs_to :course
  validates :first, :last, :course, :number, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, uniqueness: { scope: :course }
end
