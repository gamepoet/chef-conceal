require 'chef/conceal/version'
require 'chef/encrypted_data_bag_item'
require 'chef/recipe'
require 'chef/resource'
require 'chef/provider'
require 'conceal'

class Chef
  module Conceal
    module DSL
      def decrypt(data)
        key = Chef::EncryptedDataBagItem.load_secret
        ::Conceal.decrypt(data, key: key)
      end
    end
  end
end

Chef::Recipe.send(:include, Chef::Conceal::DSL)
Chef::Resource.send(:include, Chef::Conceal::DSL)
Chef::Provider.send(:include, Chef::Conceal::DSL)
