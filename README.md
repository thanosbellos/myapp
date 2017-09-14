# README
A simple rails application with minimum configuration.
It was created, so that we can understand that tha screenshot error that
is mentioned in [issue] (https://github.com/rspec/rspec-rails/issues/1865)
is really affecting system specs.

In order to reproduce the error with system specs run with the following
command

bundle exec rspec spec/system/widgets_system_spec.rb --seed 5098

Dependencies
* Ruby 2.4.1

* Posgresql

* rspec (master branch 3.7.0pre), factory girl
