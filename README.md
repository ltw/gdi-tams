# GDI Chicago TAMS

![Codeship](https://codeship.io/projects/ceff6e60-cbc9-0131-1542-069c58d51f38/status)

TAMS: Teaching Assistant Management System

A little Rails app that handles teaching assistant sign ups, emails, and reporting.

Deploy to Heroku using Unicorn with Resque for background jobs.

Staging and production environments available.

`stable` branch is production.

`staging` branch is staging.

Migrations are ran upon deploy automatically.

## Running locally

Make your database and stuffs:

```
$ bundle
$ rake db:create && rake db:migrate
```

And you should probably create an Admin user:

```
$ rails c
$ Admin.create!(name: "Me", password: "hello", password_confirmation: "hello")
```

And then to start up, you need Redis running:

```
$ redis-server
```

And launch the app using Foreman:

```
$ foreman start
```
