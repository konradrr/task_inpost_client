# InpostClient

Very simple client for sample Inpost Machines API.

## Installation


```ruby
gem 'inpost_client', git: 'git@github.com:konradrr/task_inpost_client.git'
```

## Usage

Create an instance of InpostClient (possibly with optional url) and try some action(s)!

```ruby
inpost_client = InpostClient.new
# Initially load all machines
```

### Machines

Get machines
```ruby
inpost_client.machines
# => Array of machines
```

Get machine by ID
```ruby
inpost_client.machine "XYZ-ID"
# => Machine with id=XYZ-ID
```

Get machines by type
```ruby
inpost_client.machine_by_type 1
# => Array of machines with type=1
```
