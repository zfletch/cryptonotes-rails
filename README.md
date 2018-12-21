# Cryptonotes

Encrypt and share notes.
[Try it out](https://crypto-notes.herokuapp.com/).
Or [view an existing note](https://crypto-notes.herokuapp.com/notes/1e49f95d-e7ed-42f6-b0ba-d11da38fd89d)
(the password is `foo`).

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

* `ruby ~> 2.5.1`
* `node ~> 10.5.0`
* `yarn ~> 1.9.2`
* `postgres ~> 10.4`
* `chromedriver ~> 2.41` (for running tests)

or

* `docker ~> 18.06.0`
* `docker-compose ~> 1.22.0`

### Running application

```
$ bundle install
$ yarn install
$ bundle exec rails db:create
$ bundle exec rails db:migrate
$ bundle exec rails server
```

or

```
docker-compose build
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose up
```

### Running tests

```
$ bundle exec rspec
```

or

```
docker-compose run web rspec
```
