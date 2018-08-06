# About

Example setup that allows to enqueue jobs from `elixir` app and execute them using `sidekiq`.

# Run app

```
docker-compose up
```

# Enqueue sidekiq worker through phoenix app

```
curl -XPOST -H "Content-type: application/json" -d '{ "name": "Walter White" }' 'http://localhost:4000/greet'
```

# Visit sidekiq dashboard

```
http://localhost:3000/sidekiq
```
