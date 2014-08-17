class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.belongs_to :teacher
      t.string :name
      t.string :url
      t.json :input_fields
      t.timestamps
    end
  end
end
