class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.belongs_to :student
      t.belongs_to :classroom
      t.timestamps
    end
  end
end
