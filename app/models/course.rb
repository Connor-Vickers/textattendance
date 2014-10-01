class Course < ActiveRecord::Base
  has_many :meetings, dependent: :destroy
  has_many :students, dependent: :destroy
  belongs_to :user
  validates :name, :user, presence: true
  #accepts_nested_attributes_for :meetings
end
