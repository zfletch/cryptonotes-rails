# Cryptonotes

Encrypt and share notes.
[Try it out](https://crypto-notes.herokuapp.com/).
Or [view an existing note](https://crypto-notes.herokuapp.com/notes/1e49f95d-e7ed-42f6-b0ba-d11da38fd89d)
(the password is `foo`).

## Description

Create notes with a password.
The notes are encrypted using the [Stanford Javascript Crypto Library](https://bitwiseshiftleft.github.io/sjcl/)
before being sent to the server.

Each note is associated with a `uuid` and you can access it by visiting the path `/notes/uuid`.
The content of the note is not visible until you enter the password it was encrypted with.

If the checkbox `Delete message when it is viewed.` is checked, then the note will be deleted
the next time it's viewed.

## How to run

### Requirements

* `ruby 2.5.1`
* `chromedriver`

### Instructions

```
$ git clone https://github.com/zfletch/cryptonotes-rails
$ cd cryptonotes-rails/
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rails server
```
