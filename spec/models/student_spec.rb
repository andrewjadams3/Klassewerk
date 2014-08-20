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
    @student = Student.new(:first_name => "Joe", :last_name => "Webb", :username => "ImJW", :password => "Hello", :teacher => Teacher.new)
    @student.save
  end

  subject(:student) { @student }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:teacher) }


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

  
end
