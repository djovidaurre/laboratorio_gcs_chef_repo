#
# Cookbook:: database-init
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
# cookbooks/my_postgresql/recipes/default.rb

node['lamp_stack']['repos'].each do |repo, params|
  yum_repository repo do
    description params['description']
    repositoryid repo
    baseurl params['baseurl']
    enabled params['enabled']
    gpgcheck params['gpgcheck']
  end
end
include_recipe 'pg_install::package_install' unless ::File.exist?("/var/lib/pgsql/11/data/postgresql.conf")