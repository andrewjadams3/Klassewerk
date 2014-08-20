require 'rails_helper'

  # create_table "worksheets", force: true do |t|
  #   t.integer  "teacher_id"
  #   t.string   "name"
  #   t.string   "url"
  #   t.json     "input_fields"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  # end

RSpec.describe Worksheet, :type => :model do
  before do
    @worksheet = Worksheet.new(
      teacher: Teacher.new,
      name: "Math Worksheet",
      url: "http://www.math-aids.com/images/skip-counting-worksheets.png",
      input_fields: [{x: "50px", y: "50px", height: "50px", width: "50px"}])
    @worksheet.save
  end

  subject(:worksheet) { @worksheet }
  it { 
    is_expected.to be_valid 
  }

  it "has no errors" do
    expect(@worksheet.errors.messages).to eq({})
  end

end
