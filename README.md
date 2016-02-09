# Cryptonotes

Encrypt and share notes.
[Try it out](https://rocky-anchorage-42139.herokuapp.com/).
Or [view an existing note](https://rocky-anchorage-42139.herokuapp.com/notes/1e49f95d-e7ed-42f6-b0ba-d11da38fd89d)
(the password is `foo`).

## Description

Create notes with (or without) a password.
The notes are encrypted using the [Stanford Javascript Crypto Library](https://bitwiseshiftleft.github.io/sjcl/)
before being sent to the server.
Each note is associated with a `uuid` and you can access it by visiting the path `/notes/uuid`.
The content of the note is not visible until you enter the password it was encrypted with.

## How to run

```
$ git clone https://github.com/zfletch/cryptonotes-rails
$ cd cryptonotes-rails/
$ bundle install
$ bundle exec rake db:migrate
$ bundle exec rails server
```
