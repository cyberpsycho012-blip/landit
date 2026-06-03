class Resume < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true, uniqueness: true
  validates :education, presence: true
  validates :languages, presence: true
  validates :main_tech_skill, presence: true
  validates :secondary_tech_skills, presence: true
  validates :soft_skills, presence: true
  validates :work_experiences, presence: true
  validates :years_of_experience, presence: true, numericality: { only_integer: true }
end
