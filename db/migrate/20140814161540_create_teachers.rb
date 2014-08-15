class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :security_question
      t.string :security_answer
      t.string :password_digest
      t.string :email
      t.belongs_to :school
      t.timestamps
    end
  end
end
