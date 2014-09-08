class Record < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :student
  validates :student, :meeting, :value, presence: true
  validates :student, uniqueness: { scope: :meeting }
  
  # before_validation :convert_sym
  
  # @@to_name = { nil => 'unverified', 0 => 'present', 1 => 'absent unexcused', 2 => 'absent excused'}
  # def self.get_string(record)
    # if record
	   # return @@to_name[record[:value]]
	 # else
	   # return @@to_name[record]
	 # end
  # end	
  
  # private
    # @@sym = { present: 0, absent_unexcused: 1,  absent_excused: 2}
    # def convert_sym
	   # self.value = @@sym[self.value]
    # end
end
