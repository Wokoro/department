class RemoveFileFromAssignmentSubmissions < ActiveRecord::Migration[5.0]
  def change
    remove_column :assignment_submissions, :file, :string
  end
end
