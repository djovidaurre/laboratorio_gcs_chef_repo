package "postgresql11" do
  action :install
end
 
package "postgresql11-contrib" do
  action :install
end
 
package "postgresql11-libs" do
  action :install
end
 
package "postgresql11-server" do
  action :install
end
 
execute "pg11_initdb" do
  user "postgres"
  group "postgres"
  command "/usr/pgsql-11/bin/initdb --locale en_US.UTF-8 -E UTF8 -D /var/lib/pgsql/11/data"
  action :run
end
 
service "postgresql-11" do
  action [:enable, :start]
end