# Referral Linker

*Note*: You'll need postgres running for this app. If you're using MacOS, I recommend Postgres.app

To run:

`bundle install`

*Note*: The app uses localhost and default postgres credentials by default, but you can specify these options like so `DATABASE_HOST=some.host DATABASE_USERNAME=name DATABASE_PASSWORD=pass rails s`

`rails s`

# Challenge Info

Approach: Fullstack

Problem Description:

Provides a very simple referral link system that redirects users to a landing page. I solve this by having a link model with a title. When the user visits a URL on the site matching a link's title, they are redirected and the link's count is incremented.

Technical Choices:

I chose Rails because it's what I'm most familiar with and allowed me to move quickly even though it's a little overkill for an app this size. I chose vanilla JS because the project is simple, though there are a variety of UI improvements that could be made using React (i.e. table sorting and editing links in the table instead of a separate page). I chose Slim templating because it speeds up development with its friendly syntax. I chose SASS because it just makes CSS development more flexible. I chose RSpec because it's the testing framework I'm most familiar with.

Technical Tradeoffs:

Given more time I would have:
 - Made the website responsive.
 - Used React for the table to do sorting and inline editing.
 - Overall spent more time making it look good.
 - Figured out how to make the primary key of the link a string to enable semantics like '/linkname/edit' as opposed to '/1/edit'.
 - Handled links that don't exist yet.

Hosted Link: tbd
