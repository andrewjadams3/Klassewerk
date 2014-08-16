class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.string :name
      t.string :url
      t.json :input_fields
      t.json :answer_key
      t.timestamps
    end
  end
end
