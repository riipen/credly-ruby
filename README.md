# Ruby client for the Credly API
Credly is a platform which allows users to create and share digital badges.
This  API is designed to allow Ruby developers to interact with the Credly API programmatically.

For reference, the Credly API documentation can be found here:

https://www.credly.com/docs/

## Install
```
TODO
```

## Quick Start
```ruby
client = Credly::Client.new(organization_id: 'id', auth_token: 'token')
client.badges_get
```

The `Client` class also accepts a `version:` parameter for the API version,
and a `sandbox:` boolean variable which specifies whether to use the production environment or the sandbox environment.

The default value of `sandbox:` is `false`, and the default `version:` value is `v1`

As a note, the Credly API only has version 1.0

The production URLs are constructed as follows:

`https://api.credly.com/v1/<endpoint_path>`

The sandbox URLs are constructed as follows:

`https://sandbox-api.credly.com/v1/<endpoint_path>`

Additional request examples can be found in https://github.com/jameso-student/credly-ruby/blob/main/spec/credly-ruby/actions

We will aim to make all API endpoints available from the client instance.
