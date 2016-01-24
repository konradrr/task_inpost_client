# InpostClient

Very simple client for sample Inpost Machines API.

## Installation


```ruby
gem 'inpost_client', git: 'git@github.com:konradrr/task_inpost_client.git'
```

## Usage
Use an instance of `InpostClient` to get access to actions.

```ruby
inpost_client = InpostClient.new
# Initially loads all machines
# attributes: cache_time=nil, url="https://api-pl.easypack24.net/v4"
# * cache_time - machines cache time in seconds; nil sets is to 24 hours, 0 turns off caching at all
```

```ruby
inpost_client.machines
# returns an array of machines
inpost_client.machines_by 0
# returns an array of machines with type=0
# attribute: type - type of Inpost machines
inpost_client.machine "XYZ-ID" #or inpost_client.machines.find "XYZ-ID"
# => returns machine with id=XYZ-ID
```

```ruby
inpost_client.machine("XYZ-ID").id
# returns an
```
See docs to get info about all methods and its parameters.
