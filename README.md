# Chef::Conceal

A gem and chef recipe that includes a helper method to make it easier to work with encrypted data in cookbooks.

## Installation

Add this line to your cookbooks's Berksfile:

    cookbook 'chef-conceal'

## Usage

```ruby
include_recipe 'chef-conceal::default'
decrypt(node[:my_app][:database][:password])
```
