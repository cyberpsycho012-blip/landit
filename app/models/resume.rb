class Resume < ApplicationRecord
  has_neighbors :embedding
  after_create :set_embedding

  belongs_to :user, optional: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :education, presence: true
  validates :languages, presence: true
  validates :main_tech_skill, presence: true
  validates :secondary_tech_skills, presence: true
  validates :soft_skills, presence: true
  validates :work_experiences, presence: true
  validates :years_of_experience, presence: true, numericality: { only_integer: true }

  private

  def set_embedding
    embedding = RubyLLM.embed(
      "Resume name: #{name} Education: #{education}
      Languages: #{languages} Main Teach Skill: #{main_tech_skill}
      Secondary Tech Skill: #{secondary_tech_skills}
      Soft Skill: #{soft_skills} Years of Experiance: #{years_of_experience}
      Work Experiance: #{work_experiences}."
    )
    update(embedding: embedding.vectors)
  end
end
