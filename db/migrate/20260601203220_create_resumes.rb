class CreateResumes < ActiveRecord::Migration[8.1]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :education
      t.string :main_tech_skill
      t.integer :years_of_experience
      t.string :secondary_tech_skills
      t.string :soft_skills
      t.string :languages
      t.string :work_experiences

      t.timestamps
    end
  end
end
