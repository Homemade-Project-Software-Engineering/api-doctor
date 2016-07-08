class Relationship < ActiveRecord::Base

  belongs_to :patient, class_name: "User"
  belongs_to :caregiver, class_name: "User"

  validates :patient_id,presence: true
  validates :caregiver_id,presence: true

end
