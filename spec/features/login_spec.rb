require 'rails_helper'

describe "On the login page" do
  describe "a user that is not logged in" do
    it "should be able to sign up or log in as a student or teacher" do
      visit '/'

      expect(page).to have_link('', href:"/auth/teacher_login")
      expect(page).to have_link('', href:"/auth/teacher_signup")
      expect(page).to have_link('', href:"/auth/student_login")
      expect(page).to have_link('', href:"/auth/student_signup")
    end
  end

  describe "a user who is logged in as a teacher" do
    before do
      teacher = Teacher.create(first_name: 'test', last_name: 'test',
                               email: 'test@test.com', password: 'test')
      page.set_rack_session(:user_id => teacher.id)
      page.set_rack_session(:user_type => 'teacher')      
    end

    it "should be redirected to /teachers" do
      visit '/'
      expect(page).not_to have_link('', href:"/auth/teacher_login")
    end
  end

  describe "a user who is logged in as a student" do
    before do
      student = Student.create(first_name: 'test', last_name: 'test',
                               username: 'test', password: 'test')
      page.set_rack_session(:user_id => student.id)
      page.set_rack_session(:user_type => 'student')      
    end

    it "should be redirected to /students" do
      visit '/'
      expect(page).not_to have_link('', href:"/auth/teacher_login")
    end
  end
  
end