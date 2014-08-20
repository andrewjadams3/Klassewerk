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
      teacher: Teacher.new(
        :first_name => "Bill", 
        :last_name => "Teacher", 
        :password => "password", 
        :password_confirmation => "password",
        :email => "email@email.com", 
        :class_code => "ABC-456"),
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

  describe "when teacher is not present" do
    before { @worksheet.teacher = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when name is not present" do
    before { @worksheet.name = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when url is not present" do
    before { @worksheet.url = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when input_fields are not present" do
    before { @worksheet.input_fields = nil }
    it { is_expected.to_not be_valid }
  end
end
