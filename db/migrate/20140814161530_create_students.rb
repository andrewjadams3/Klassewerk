class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.belongs_to :teacher
      t.timestamps
    end
    add_index :students, :username, unique: true
  end
end
