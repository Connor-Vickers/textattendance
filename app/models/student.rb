class Student < ActiveRecord::Base
  has_many :records, dependent: :destroy
  has_many :meetings, through: :records#untested
  belongs_to :course
  validates :first, :last, :course, :number, presence: true
  validates :number, uniqueness: { scope: :course }
end
