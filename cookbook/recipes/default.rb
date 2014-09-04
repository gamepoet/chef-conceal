chef_gem 'chef-conceal' do
  version run_context.cookbook_collection['chef-conceal'].version
  if node[:'chef-conceal'][:_local_deploy]
    source "/pkg/chef-conceal/chef-conceal-#{run_context.cookbook_collection['chef-conceal'].version}.gem"
  end
  action :nothing
end.run_action(:install)

require 'chef/conceal'
