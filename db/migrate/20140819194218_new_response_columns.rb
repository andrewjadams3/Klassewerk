class NewResponseColumns < ActiveRecord::Migration
  def change
    add_column :responses, :grading, :json
    add_column :responses, :notes, :string
  end
end
