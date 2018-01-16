Team Rhys & Nikolaos
===================

### What is the app about?
It's an app similar to yelp, but instead of rating restaurant you rate workshops.

### Functions
An admin can create/update/destroy
- workshops
- feedbacks

A user can:
- can see workshops/feedback
- create feedback

### How to install / Run
- First you need to fork/clone the repo to your account

- Check that you have the correct version of Ruby running (2.4.1) & Rails installed on your machine [ ```gem install rails```]

- Do ``` bundle install```

- Ensure that you have postgreSQL installed on your machine & create databases by running: ``` createdb monster_cat_development``` and ``` monster_cat_test```

- Migrate database by running ``` rails db:migrate```

- Run the test using RSpec from your CLI by using ```rspec```

- Run the server ``` rails server``` & visit the app using the browser of your preference by navigating to ```localhost:3000```
