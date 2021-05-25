# New Brewer on the Block

[![Codeship Status for Osnyder12/New-Brewer-on-the-Block](https://app.codeship.com/projects/be6f19f3-4401-46c1-b0fc-7390b75a23b6/status?branch=master)](https://app.codeship.com/projects/443166)

## Description

A site for those who are new to homebrewing where they can find basic recipes and instructions. Users can also review others recipes.

### Technologies

New Brewer on the Block was created using a Ruby on Rails backend with PostgreSQL database, Active Record for data persistence, and React JavaScript frontend. User functionality and authentication was achieved using the Devise gem. The [Punk API](https://punkapi.com/documentation/v2) was used for all BrewDog recipe information and data. The Cocoon gem was used for nested rails forms for the new beer creation. 

Visit [New Brewer on the Block](https://new-brewer.herokuapp.com/) on Heroku or set up locally with the directions below.

## Setup

Clone the repository from GitHub:

```
git clone https://github.com/Osnyder12/New-Brewer-on-the-Block.git
```

Change to directory and install dependencies:

```
cd New-Brewer-On-The-Block
bundle install
yarn install
```

Create and set up database:

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

In your terminal start your server:

`bundle exec rails s`

Finally, navigate to http://localhost:3000 in your browser.

## Features

- View a home page with the option of choosing Admin created starter recipes or recipes from BrewDog via the Punk API.
- Click on a homebrewing recipe to view the recipe details, description ingredients, instructions and user submitted reviews.
- Sign up and sign in available for members to add their own reviews, and review other recipes.
- Administrators can add new starter recipes, delete user reviews and add their own reviews.

## TODO

- [] User can edit and delete their own reviews.

- [] Add a list of starter equipmenmt necessary for home-brewing.

- [] User can edit and delete their own reviews.

- [] A user can add and edit new starter recipes.

### Contribution Guidelines

If you find issues or bugs with this application, please add an issue on GitHub. If you would like to add a feature, please create a pull request and it will be reviewed accordingly.
