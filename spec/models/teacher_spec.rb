require 'rails_helper'

# def change
#     create_table :teachers do |t|
#       t.string :first_name
#       t.string :last_name
#       t.string :username
#       t.string :security_question
#       t.string :security_answer
#       t.string :password_digest
#       t.string :email
#       t.belongs_to :school
#       t.timestamps
#     end

RSpec.describe Teacher, :type => :model do
  before do
    @teacher = Teacher.new(:first_name => "Joe", :last_name => "Webb", :password_digest => "Hello", :email => "email@email.com", :school => School.new)
    @teacher.save
  end

  it 'should belong to a school' do
    expect(@teacher.school).to be_a(School)
  end
 
  subject(:teacher) { @teacher }
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to be_valid }

  it 'should have a first_name' do
    expect(@teacher.first_name).to eq("Joe")
  end

  it 'should have a last_name' do
    expect(@teacher.last_name).to eq("Webb")
  end

  it "has no errors" do
    expect(@teacher.errors.messages).to eq({})
  end
 
end








