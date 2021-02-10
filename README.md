# Bookmark Manager
Week 4 of Makers Academy afternoon challenge: building a bookmark manager.

![](Domain_model.png)

### To set up the database:

1. Connect to psql
2. Create the bookmark_manager database: `CREATE DATABASE bookmark_manager;`
3. To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

Run `rackup -p 3000`

To view bookmarks, navigate to `localhost:3000/bookmarks`.

### User stories:
```
As a user,
So I can see my saved bookmarks,
I'd like to be able to pull up a list of saved bookmarks

As a user,
So I can save a website,
I'd like to add the website's address to my bookmark manager

As a user,
So I can remove websites I don't like,
I'd like to be able to delete websites from my bookmark manager

As a user,
So I can edit my bookmark manager,
I'd like to be able to update my bookmarks

As a user,
So the bookmarks I save are useful,
I'd like to only save valid URLs

As a user,
So I can keep notes about my bookmarks,
I want to add comments to them

As a user,
So that I can categorize my Bookmarks,
I want to add tags to them
```
