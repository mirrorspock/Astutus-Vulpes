# Ruby on Rails training

This repo can be used with the Rails training from Kabisa.

It is tailored compatible with Ruby on Rails version 4.2.

# Prerequisites

- Install [Virtualbox](https://www.virtualbox.org/)
- Install [Vagrant](https://www.vagrantup.com/)
- Install [Atom](https://atom.io/) editor

# Prepare

- checkout out this repository
- cd into the repo and run: ```vagrant up```
- run ```vagrant ssh``` to login to the box and start your journey

# Handy commands

## SQLite

|command|description|
|-------|-----------|
| `sqlite3 -column -header db/development.sqlite3` | Open SQLite database |
| `.tables` | Show tables inside SQLite database |
| `.schema [tablename]` | Show the definition of the schema |
| `SELECT * FROM [tablename]` | Show the contents of the table |


# Ruby & Ruby on Rails resources

- Ruby docs - http://ruby-doc.org/
- Ruby on Rails API - http://api.rubyonrails.org/v4.2.7/
- Ruby on Rails Guides - http://guides.rubyonrails.org/v4.2/
