[ ![Codeship Status for andrewjadams3/Classwork](https://www.codeship.io/projects/eb148f30-05f5-0132-8fe1-4e33fd065d6f/status?branch=master)](https://www.codeship.io/projects/30994)

#README

##App Background:

Schools have begun using iPads, and other technologies, to provide students with paperless assignments. Teachers who already have set curriculums, often on paper / word docs, etc, need to have a way to scan his/her documents and create  interactive assignments that are accessible for his/her students. 

Students need to be about to work on these assignments and submit them to the teacher, via the Interweb.

##Features:

Sign up: Should be as simple as possible for children.
  Students sign up with security question, full name, and username.
  Teachers sign up with full name, email, and school code.
  
Views: Teachers and Students will not view the same templates.
  Teachers will have a Welcome Center that will allow them to upload thier paper-bound curriculum and assigments.
  Teachers will then be able to assign their uploaded documents to their students via a Classroom Center.
  Students will be able to view assigments and curriculum information via their Classroom Center.
  Students will be able to work on assigments and create responses in their Classroom Center, which they can then submit     for grading.
  
  
  
##Target audience:

Elementary and middle-school level teachers/students who want to convert their paper and word-doc worksheets easily for use on digital/Ipad technology.

##Technologies: 
Backend: Rails, background jobs for PDF processing? Sidekiq
Frontend: jQueryUI, Foundation, Ember?
Deploy: Heroku hosting
File Processing: Uploading PDF?, CarrierWave?, Upload Docs?, (Look into API for conversion)
Database/Storage: PostgreSQL, Amazon DB (for images)
CI Testing: Codeship
Test coverage: simplecov
Testing: RSpec, Jasmine, Capybara
Templating: Emblem.js/Handlebars.js
Optional features tech: paper.js, d3, jQuery mobile





<tt>rake doc:app</tt>.
