# Description
This website can be used to keep track of all maintenance activity at Sail Chicago. This includes all user activity, parts and work history

# Install instructions
Download repository 

Run the following to install the required dependencies

    bundle install

To seed test data run 

    rails db:seed

In the project directory run 

    rails s

visit http://localhost:3000/

# Navigation bar
A user can
- go home
- create a new project
- View projects by type via a dropdown menu
- View all projects of the logged in user by clicking name
- logout
Features
- shows name of person in the right corner with a link to their user page
- When not logged in it presents a sign up and sign in link

# Home page
A user can
- see all public projects

# Signup page
A user can
- enter a name
- enter an email
- enter a password
- or login with google Oauth
Features
- redirected with an error if any field is left blank on submission

# Signin page
A user can
- enter a username
- enter a password
- sign in with google
Features
- redirected with an error if any field is left blank on submission
- Directs user to their showpage

# User show
A user can see
- all projects
Features
- If user is currently the user that is logged in it will show private projects

# Project show
- Breadcrumb feature
- Title
- Brief description
- Carosel of pictures with controls
- Created by user with link to user page
- Date added
- Private or public
- List of parts and materials with quantity indicators
- Links to part show pages
- Main description
- If user is the logged in user buttons to edit and delete

# Part show
- Title
- Description
- Link to part website

# Type show
- Title of type at the top
- Card list of all projects associated with this type
- Only shows public projects

# Create new project form
- Name (required)
- Public (defaults to false)
- Type selection (required)
- Brief description (required 6-255 char)
- Image selection (required 1-10 images)
- Parts select from existing parts
- Click add part to dynamically add parts fields
- Add as many parts as needed
- Create project redirects to a page to set quantities of parts if there is any
- redirects to project show page

# license

This application available open source under the terms of the MIT license 
https://opensource.org/licenses/MIT