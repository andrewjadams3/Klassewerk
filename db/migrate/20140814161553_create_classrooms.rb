class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.belongs_to :teacher
      t.belongs_to :student
      t.timestamps
    end
  end
end
