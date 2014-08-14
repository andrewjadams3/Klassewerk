class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :student
      t.belongs_to :worksheet
      t.json :answers
      t.boolean :submitted
      t.timestamps
    end
  end
end
