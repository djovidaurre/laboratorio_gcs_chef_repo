#
# Cookbook:: webserver-init
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

package 'git'
package 'tree'

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

template "/etc/nginx/nginx.conf" do   
  source "nginx.conf.erb"
  notifies :reload, "service[nginx]"
end
