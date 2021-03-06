CNS Registration Portal Web Application
================

Project Description
--------------------
This is a web app designed to automate and digitize the Chenango Valley Nursery School's class and summer registration process.

This project was designed and developed by students at Colgate University.


Project Features
----------------
- Create a user account with an associated username and password.
- Create a parent account linked to your user account.
- Register any number of children who will all be associated with your parent account.
- All associated children will inherit the parents information.
- Edit and delete all information associated with users, parents and children.
- While creating or updating the children's information, the form will dynamically
  generate to only show relevant questions based off of the questions you have
  already answered.
- Create an admin account.
- Give other accounts admin privileges.
- Export all parent and children information in an easy to read excel document.
- As an admin, you can view and edit all other users parent and children information.



Dependencies
------------
This application uses:
- Ruby 2.4.1
- Rails 5.1.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).


Installation
-------------
- Clone the git repo at: https://github.com/mikerapaport/CNS.git
- Run bundle install to install gems
- Run rails db:migrate to set up database
- Run rails db:seed to seed admin account


Contributors
------------
- Laura Bunn
- Sam Burt
- Zach Harris
- Michael Rapaport
- Zoila Rodriguez
- Leslie Subaldo

This app was generated using rails devise pundit. Documentation can be found at: https://github.com/RailsApps/rails-devise-pundit


What's Next? (for next development team)
----------------------------------------
- Add capability for 2 parent accounts to be associated with 1 (or more) child(ren)
- Email confirmations (to parents confirming registrations/edits and to admin summarizing recent registrations)
- Connect to Quickbooks and/or Child Care Manager API to automate entire process

- Advice: familiarize yourself with the authorization process, the set up of views/stylesheets and how a user navigates between pages, variable names in the database migration and what they stand for with respect to the forms, and associations between parents/users/children before adding new functionality.
