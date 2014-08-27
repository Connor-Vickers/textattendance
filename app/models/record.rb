class Record < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :student
  validates :student, :meeting, :value, presence: true
  validates :student_id, uniqueness: { scope: :meeting_id }
end
