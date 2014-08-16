class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :code
      t.belongs_to :teacher
      t.string :title
      t.belongs_to :grading_period
      t.timestamps
    end
  end
end
