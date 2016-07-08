class Alarm < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: {minimum:5 ,maximum: 50}
end
