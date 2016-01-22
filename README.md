# InpostClient

Very simple client for sample Inpost Machines API.

## Installation


```ruby
gem 'inpost_client', git: 'git@github.com:konradrr/task_inpost_client.git'
```

## Usage

Create an instance of InpostClient (possibly with optional url)

```ruby
inpost_client = InpostClient.new
# Initially loads all machines
```

### Machines

Get machines
```ruby
inpost_client.machines
# => Array of machines
```

Get machine by ID
```ruby
machine = inpost_client.machine "XYZ-ID"
# => Machine with id=XYZ-ID
machine.id
# => "XYZ-ID"
```

Get machines by type
```ruby
inpost_client.machines_by_type 0
# => Array of machines with type=0
```
