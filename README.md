# Matchmade Readme

Matchmade is a full-stack application that tells users what podcasts, TV shows, or movies they and friend are both insterested in consuming. 

This is a Proof of Concept, and currently only handles NPR podcast feeds.</p>

## Technology Used

---

This project uses

* Ruby v2.4.0
* Rails 5.2.4.4


## Get Started
---

###  Clone the repo

```
$ git clone https://github.com/SmallNic/matchmade.git
$ cd matchmade
```

### Check your Ruby version

```
$ ruby -v
```

If your version is earlier than the Ruby version above, you may need to update it. You can use [Ruby Version Manager (RVM)](https://rvm.io/) to install and select the proper Ruby environment.

### Install Dependencies

Perform a bundle install:

```
$ bundle install
```

### Initialize the database

```
$ rake db:create db:migrate db:seed
```

### Start the dev server

```
$ rails s
```

## Happy Flow

---

1. Open http://localhost:3000/

2. Sign in using the user details in the seeds file

3. Add items (podcast episodes) to show interest in. You can use this Feed URL for the Hidden Brain podcast: https://www.omnycontent.com/d/playlist/aaea4e69-af51-495e-afc9-a9760146922b/d2c4e775-99ce-4c17-b04c-ac380133d68c/2c6993d0-eac8-4252-8c4e-ac380133d69a/podcast.rss

4. Go to /items and select all the items that interest you. 

5. Sign out and back in with the other user. (Alternatively stay signed in but sign in as second user with incognito browser)

6. Go to /items and select a different set of items that interest you. Make sure you have at least one overlap with the first user.

7. As either user go to /matches to see the list of items that interested both users.

