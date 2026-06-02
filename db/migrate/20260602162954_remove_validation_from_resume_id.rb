class RemoveValidationFromResumeId < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :resume_id, true
  end
end
