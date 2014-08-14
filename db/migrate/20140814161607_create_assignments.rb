class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :classroom
      t.belongs_to :worksheet
      t.datetime :due_date
      t.datetime :assigned_date
      t.timestamps
    end
  end
end
