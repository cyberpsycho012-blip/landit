class RemoveResumeIdColumnFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :resume_id
  end
end
