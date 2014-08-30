class Meeting < ActiveRecord::Base
  has_many :records, dependent: :destroy
  has_many :students, through: :records
  belongs_to :course
  validates :when, :name, :course, presence: true
  validates :auth, uniqueness: { allow_nil: true }
end
