class NewResponseColumns < ActiveRecord::Migration
  def change
    add_column :responses, :notes, :string
  end
end
