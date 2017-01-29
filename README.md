Chitter Challenge
=================

The aim is to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
-------

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on technologies used
---------------------------

* The app is written using tests capybaa /rspec tests as in 'red-green-refactor'
* The app is built using Sinatra modular framework
* Ruby classes link via DataMapper to a postgres database

chitter_test=# SELECT * FROM makers;

 id | email | password_digest | name | handle

chitter_test=# SELECT * FROM peeps;

 id | peep_body | peep_time | maker_id

 Link by DataMapper association (```maker has n, :peeps```) (```peep belongs_to :maker```)

* The ruby gem 'bcrypt' is used to secure the passwords.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* There are two user states - 'logged in' or 'not logged in'.You only can peep if you are logged in.
* You don't have to be logged in to see the peeps.

![Domain Model][logo]
[logo]: https://github.com/olwend/chitter-challenge/blob/master/Chitter.png

Installation and running tests:
-------------------------------
Git clone or download to a local directory.
Run tests on command-line by typing `rspec`
Run the web app from command-line by typing `ruby chapp.rb` , visit `localhost:4567` in browser.

Bonus:
-----

If you have time you can implement the following:

* In order to start a conversation as a maker I want to reply to a peep from another maker.

And/Or:

* Work on the css to make it look good (we all like beautiful things).

Good luck and let the chitter begin!

Code Review
-----------

In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance may make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.
