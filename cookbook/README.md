# chef-conceal

Chef-conceal is a gem and chef recipe that includes a helpful DSL method to decrypt attributes with encrypted content using the encrypted_data_bag_secret file as the key.

## Supported Platforms

* Ubuntu

## Installation

Add `chef-conceal` to your `Berksfile`:

```ruby
cookbook 'chef-conceal'
```

## Usage

In order to use chef-conceal in your recipes, you'll first need to include it:

```ruby
include_recipe 'chef-conceal'
```

This will extend the recipe, resource, and provider DSLs with a `decrypt` convenience method.

## Encrypting plaintext

Use the `conceal` gem (https://github.com/gamepoet/conceal) to encrypt your plaintext into an encoded string. Generating a new password and putting it in the clipboard can be as easy as:

```
$ ruby -rsecurerandom -e 'print SecureRandom.urlsafe_base64(32)' | conceal encrypt ~/.chef/encrypted_data_bag_secret | pbcopy
```

## Examples

Given a chef environment

```
$ knife environment show chef_conceal_example
chef_type: environment
default_attributes:
  my_password: '1:aes-256-cbc:toekea56oRvQG1KpJNo2tw==:NjI2MjFmNjliODk4ZDM0YjJmNTQzNzdhMDdlMTBjZjhhMTUyZDQ0NTkyNjVlYjY1ODM4OTk4YmI0NDA0MmFlMDAzNWE4MDYwNjdmMDA3MTAxZWQ1NjBjZGNjMGYxNGNjYTM2YzMzYWIzYzYyNTFjNGYxZWQzNGFkYjkzZTgyN2M3YzBjY2JhNDUzNWVjYjkwY2FmODEzNGJhNWRkZmNmZGI2ZTM0NWI0MzUzMGZhODY1OGIxNjU5NjU0N2JiMDg1NzMxNWEzMmMxYWRiNzBjNWZkZWJhZDFhYzVhMGM4NzllYTQyNjViODVlOWMwYTIxZjM1OGYzZWJkMTBmY2M0Zg==:oh8bn5krZvMKiIzYt5LFEvEZMZt3sDS2Q4jL97Vty0g=:rnaFQ4su+/tSjtondhXKbSlbmbmLSIndPaBA++2kMgw='
json_class: Chef::Environment
name: chef_conceal_example
```

You could then write a recipe that references the decrypted content of the attribute with the `decrypt` function which will automatically use your `encrypted_data_bag_secret` as the key.

```ruby
include_recipe 'chef-conceal'

log decrypt(node[:my_password])
```

## Authors

* Ben Scott (<gamepoet@gmail.com>)
