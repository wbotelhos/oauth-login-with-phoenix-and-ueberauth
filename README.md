# OAuth Login with Phoenix and Überauth

A guide teaching how add an [OAuth](https://pt.wikipedia.org/wiki/OAuth) login using [Überauth](https://github.com/ueberauth/ueberauth).

Read the article at [OAuth Login with Phoenix and Überauth](oauth-login-with-phoenix-and-uberauth).

# Setup

```sh
# clone the project
git clone git@github.com:wbotelhos/oauth-login-with-phoenix-and-uberauth.git

# access the project
cd oauth-login-with-phoenix-and-uberauth

# installs the dependencies
mix deps.get

# creates the database
mix ecto.setup

# installs assets
cd assets && yarn install && cd -

# run the server
mix phx.server

# open the browser
open localhost:4000/persons
```
