# Cryptonotes

Encrypt and share notes.

## Description

Create notes with a password.
All notes are encrypted and decrypted entirely on the client side
using the [Stanford Javascript Crypto Library](https://bitwiseshiftleft.github.io/sjcl/).
The server only ever sees the encrypted message.

Each note is associated with a `uuid` and you can access it by visiting the path `/notes/uuid`.
The content of the note is not visible until you enter the password it was encrypted with.

If the checkbox `Delete message when it is viewed.` is checked, then the note will be deleted
the next time it's viewed.

## How to run

### Requirements

* `ruby ~> 3.4.4`
* `node ~> 24.3.0`
* `yarn ~> 1.22.22`
* `postgres ~> 14.17`

### Running the application

```
$ bundle install
$ yarn install
$ bundle exec rails db:create
$ bundle exec rails db:migrate
$ bundle exec rails server
```

### Running with Docker and Docker Compose

```
docker-compose build
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose up
```

Replace `docker-compose` with `podman compose` or whatever program you'd like
to use.

### Running tests

```
$ bundle exec rspec
```
