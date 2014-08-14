class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :code
      t.string :location
      t.string :name
      t.string :mascot
      t.timestamps
    end
  end
end
