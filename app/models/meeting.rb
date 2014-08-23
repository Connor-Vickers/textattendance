class Meeting < ActiveRecord::Base
  has_many :records
  has_many :students, through: :records
  validates :when, :name, presence: true
end
