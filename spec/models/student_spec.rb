require 'rails_helper'

# create_table "students", force: true do |t|
#     t.string   "first_name"
#     t.string   "last_name"
#     t.string   "username"
#     t.string   "security_question"
#     t.string   "security_answer"
#     t.string   "password_digest"
#     t.integer  "school_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe Student, :type => :model do
  before do
    @student = Student.new(:first_name => "Joe", :last_name => "Webb", :username => "ImJW", :security_question => "Hello", :security_answer => "Hello",:password_digest => "Hello", :school => School.new)
    @student.save
  end

  it 'should belong to a school' do
    expect(@student.school).to be_a(School)
  end
 
  subject(:student) { @student }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:security_question) }
  it { is_expected.to respond_to(:security_answer) }
  it { is_expected.to respond_to(:password_digest) }
  

  it 'should have a first_name' do
    expect(@student.first_name).to eq("Joe")
  end

  it 'should have a last_name' do
    expect(@student.last_name).to eq("Webb")
  end

  it 'should have a username' do
    expect(@student.username).to eq("ImJW")
  end

  it { is_expected.to be_valid }
  it "has no errors" do
    expect(@student.errors.messages).to eq({})
  end

  
  describe "Must have all validations" do
    before do
     @student = Teacher.new(:first_name => "Joe", :last_name => "Webb", :username => "ImJW", :security_question => "Hello", :password_digest => "Hello", :school => School.new)
    end
    it { is_expected.to_not be_valid }
  end  

end