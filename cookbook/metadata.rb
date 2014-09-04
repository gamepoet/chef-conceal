name             'chef-conceal'
maintainer       'Ben Scott'
maintainer_email 'gamepoet@gmail.com'
license          'MIT'
description      'Adds a decrypt function so you can store secrets in attributes.'
long_description 'Adds a DSL function to let you decrypt attribute values encrypted with the conceal gem.'
version          IO.read(File.expand_path('../../lib/chef/conceal/version.rb', __FILE__)).sub(/\A.*VERSION\s*=\s*['"]([^'"]+)['"].*\z/m, '\1')

supports 'ubuntu'
