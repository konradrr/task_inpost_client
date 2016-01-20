# InpostClient

Very simple client for sample Inpost Machines API.

## Installation

```ruby
gem 'inpost_client'
```

Or

```
gem install inpost_client
```

## Usage

Create an instance of InpostClient (possibly with optional url) and try some action(s)!

```ruby
inpost_client = InpostClient.new
```

### Machines

```ruby
inpost_client.get_machines
# => Array of Inpost machines
```
