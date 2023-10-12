[![Gem Version](https://badge.fury.io/rb/credly-ruby.svg)](https://badge.fury.io/rb/credly-ruby)
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/riipen/credly-ruby/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/riipen/credly-ruby/tree/main)

# Credly Ruby

An API client for the Credly REST API in ruby.

Credly API documentation can be found here:

https://www.credly.com/docs/

## Installation

Add to your `Gemfile`:

```ruby
gem 'credly-ruby'
```

Then `bundle install`.

## Usage

### Quick Start

```ruby
client = Credly::Client.new(auth_token: 'my_organization_token')

client.badge_list(organization_id)
```

The `Client` class also accepts the following options:

|Option|Type|Description|Default|
|------|----|-----------|-------|
|sandbox|boolean|Whether to use the sandbox environment.|false|
|version|string|The API version to use.|v1|

Additional request examples can be found in https://github.com/riipen/credly-ruby/blob/main/spec/credly-ruby/actions

### Errors

Any error code returned by the Credly API will result in one of the following expections

|Code|Exception|
|----|---------|
|400| Credly::BadRequest|
|401| Credly::Unauthorized|
|403| Credly::Forbidden|
|404| Credly::NotFound|
|410| Credly::Gone|
|4xx| Credly::ClientError|
|500| Credly::InternalServerError|
|503| Credly::ServiceUnavailable|
|5xx| Credly::ServerError|

## License

Copyright (C) 2023 Riipen. See [LICENSE](https://github.com/riipen/credly-ruby/blob/master/LICENSE.md) for details.