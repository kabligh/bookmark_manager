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
