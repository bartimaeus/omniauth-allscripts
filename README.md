# OmniAuth AllScripts

[![Build Status](https://travis-ci.org/bartimaeus/omniauth-allscripts.svg?branch=master)](https://travis-ci.org/bartimaeus/omniauth-allscripts)

An AllScripts OAuth2 strategy for OmniAuth.

This is an OmniAuth strategy for authenticating to AllScripts. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [AllScripts Applications Page](https://developer.allscripts.com).

**NOTE** We are using AllScript's Practice Manager sandbox endpoint.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-allscripts'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-allscripts

## Usage

```ruby
use OmniAuth::Builder do
  provider :allscripts, ENV['ALLSCRIPTS_CLIENT_ID'], ENV['ALLSCRIPTS_CLIENT_SECRET']
end
```

## Scopes

AllScripts FHIR API lets you set scopes to provide granular access to different types of data:

```ruby
use OmniAuth::Builder do
  provider :allscripts, ENV['ALLSCRIPTS_CLIENT_ID'], ENV['ALLSCRIPTS_CLIENT_SECRET'], scope: "launch openid patient/*.read"
end
```

More info on [Scopes](http://docs.smarthealthit.org/authorization/scopes-and-launch-context).

## Contributing

1.  Fork it
2.  Create your feature branch (`git checkout -b my-new-feature`)
3.  Commit your changes (`git commit -am 'Add some feature'`)
4.  Push to the branch (`git push origin my-new-feature`)
5.  Create new Pull Request
