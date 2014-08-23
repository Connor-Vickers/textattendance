class Record < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :student
  validates :student_id, :meeting_id, :value, presence: true
end
