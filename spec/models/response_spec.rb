require 'rails_helper'

# create_table "responses", force: true do |t|
#     t.integer  "student_id"
#     t.integer  "worksheet_id"
#     t.json     "answers"
#     t.boolean  "submitted"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.string   "notes"
#   end

RSpec.describe Response, :type => :model do
  before do
    @response = Response.new(
      student: Student.new(:first_name => "Joe", 
        :last_name => "Webb", 
        :username => "ImJW", 
        :password => "Hello", 
        :password_confirmation => "Hello", 
        :teacher => Teacher.new(
          :first_name => "Bill", 
          :last_name => "Teacher", 
          :password => "password", 
          :password_confirmation => "password",
          :email => "email@email.com", 
          :class_code => "ABC-456")),
      worksheet: Worksheet.new(
        teacher: Teacher.new(
          :first_name => "Bill", 
          :last_name => "Teacher", 
          :password => "password", 
          :password_confirmation => "password",
          :email => "email@email.com", 
          :class_code => "ABC-456"),
        name: "Math Worksheet",
        url: "http://www.math-aids.com/images/skip-counting-worksheets.png",
        input_fields: [{x: "50px", y: "50px", height: "50px", width: "50px"}]),
      answers: [{content: "A flibberty-gibbet"},
            {content: "How appropriate, you fight like a cow."}],
      submitted: true,
      grading: [{correct: false},
                {correct: true}],
      notes: "Needs work. 1/2 You FAIL."
    )
    @response.save
  end

  subject(:response) { @response }

  it { is_expected.to respond_to(:worksheet) }
  it { is_expected.to respond_to(:student) }
  it { is_expected.to respond_to(:answers) }
  it { is_expected.to respond_to(:submitted) }
  it { is_expected.to respond_to(:grading) }
  it { is_expected.to respond_to(:notes) }

  it { is_expected.to be_valid }
  it "has no errors" do
    expect(@response.errors.messages).to eq({})
  end

  it 'should belong to a student and a worksheet' do
    expect(@response.student).to be_a(Student)
    expect(@response.worksheet).to be_a(Worksheet)
  end
end
