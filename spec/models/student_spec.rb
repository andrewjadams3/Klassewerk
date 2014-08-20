require 'rails_helper'

# create_table "students", force: true do |t|
#     t.string   "first_name"
#     t.string   "last_name"
#     t.string   "username"
#     t.string   "password_digest"
#     t.integer  "teacher_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#   end

RSpec.describe Student, :type => :model do
  before do
    @student = Student.new(:first_name => "Joe", 
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
        :class_code => "ABC-456"))
    @student.save
  end

  subject(:student) { @student }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:teacher) }


  it 'username is lowercased' do
    expect(@student.username).to eq(@student.username.downcase)
  end

  it { is_expected.to be_valid }
  it "has no errors" do
    expect(@student.errors.messages).to eq({})
  end

  describe "when the first name is not present" do
    before {@student.first_name = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when the last name is not present" do
    before {@student.last_name = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when the password is not present" do
    before {@student.password = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when the password confirmation is not present" do
    before {@student.password_confirmation = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when the password does not match the password confirmation" do
    before {@student.password = "123" }
    it { is_expected.to_not be_valid }
  end

  describe "when the teacher / classroom code is not present" do
    before {
      @student.teacher = nil 
      @student.save
    }
    it { is_expected.to_not be_valid }
    it "the error code is 'code is not correct'" do
      expect(@student.errors.messages).to eq({:teacher=>["/ Class code is incorrect."]})
    end
  end
end
