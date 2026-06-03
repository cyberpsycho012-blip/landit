class ChangeColumnToText < ActiveRecord::Migration[8.1]
  def change
    change_column :resumes, :education, :text
    change_column :resumes, :work_experiences, :text
  end
end
