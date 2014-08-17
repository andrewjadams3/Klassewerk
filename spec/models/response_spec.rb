# require 'rails_helper'

#   # create_table "responses", force: true do |t|
#   #   t.integer  "student_id"
#   #   t.integer  "worksheet_id"
#   #   t.json     "answers"
#   #   t.boolean  "submitted"
#   #   t.datetime "created_at"
#   #   t.datetime "updated_at"
#   # end

# RSpec.describe Response, :type => :model do
#   before do
#     @response = Response.create
#     @response.save
#   end

#   it { is_expected.to respond_to(:worksheet) }
#   it { is_expected.to respond_to(:student) }

#   it { is_expected.to be_valid }
#   it "has no errors" do
#     expect(@response.errors.messages).to eq({})
#   end

#   it 'should belong to a student and a worksheet' do
#     @response.student = Student.create
#     @response.worksheet = Worksheet.create
#     @response.save
#     expect(@response.student).to be_a(Student)
#     expect(@response.worksheet).to be_a(Worksheet)
#   end
# end
