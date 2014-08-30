class Record < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :student
  validates :student, :meeting, :value, presence: true
  validates :student, uniqueness: { scope: :meeting }
end
