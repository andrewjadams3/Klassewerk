class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :class_code
      t.string :password_digest
      t.timestamps
    end
  end
end
