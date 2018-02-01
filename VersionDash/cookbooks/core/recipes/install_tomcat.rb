# make sure we have java installed
include_recipe 'core::install_java'

user 'chefed'

user 'vdash_user' do
  action :create
end

# put chefed in the group so we can make sure we don't remove it by managing cool_group
group 'vdash_group' do
  members ['chefed', 'vdash_user']
  action :create
end

# Install Tomcat 8.0.47 to the default location
tomcat_install 'vdash' do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.47/bin/apache-tomcat-8.0.47.tar.gz'
  tomcat_user 'vdash_user'
  tomcat_group 'vdash_group'
end

# Install Tomcat 8.0.47 to the default location mode 0755
tomcat_install 'vdash' do
  dir_mode '0755'
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.47/bin/apache-tomcat-8.0.47.tar.gz'
  tomcat_user 'vdash_user'
  tomcat_group 'vdash_group'
end

# Drop off our own server.xml that uses a non-default port setup
# cookbook_file '/opt/tomcat_vdash/conf/server.xml' do
#   source 'helloworld_server.xml'
#   owner 'root'
#   group 'root'
#   mode '0644'
#   notifies :restart, 'tomcat_service[vdash]'
# end

# remote_file '/opt/tomcat_vdash/webapps/sample.war' do
#   owner 'vdash_user'
#   mode '0644'
#   source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
#   checksum '89b33caa5bf4cfd235f060c396cb1a5acb2734a1366db325676f48c5f5ed92e5'
# end

# Drop off our own server.xml that uses a non-default port setup
cookbook_file '/opt/tomcat_vdash/webapps/VersionDash.war' do
  source 'VersionDash.war'
  owner 'vdash_user'
  group 'vdash_group'
  mode '0644'
  notifies :restart, 'tomcat_service[vdash]'
end

config_dir = "/opt/tomcat_vdash/webapps/VersionDash/WEB-INF/"

directory config_dir do
  owner 'vdash_user'
  group 'vdash_group'
  recursive true
end

cookbook_file '/opt/tomcat_vdash/webapps/VersionDash/WEB-INF/web.xml' do
  source 'web.xml'
  owner 'vdash_user'
  group 'vdash_group'
  mode '0644'
  notifies :restart, 'tomcat_service[vdash]'
end

# config_dir = "/opt/tomcat_vdash/conf"

# directory config_dir do
#   owner 'vdash_user'
#   group 'vdash_group'
#   recursive true
# end

# cookbook_file '/opt/tomcat_vdash/conf/context.xml' do
#   source 'context.xml'
#   owner 'vdash_user'
#   group 'vdash_group'
#   mode '0644'
#   notifies :restart, 'tomcat_service[vdash]'
# end

# template "#{config_dir}/database.yml" do
#   source "database.yml.erb"
#   ...
# end

tomcat_service 'vdash' do
   action [:start, :enable]
     env_vars [{ 'CATALINA_PID' => '/opt/tomcat_vdash/bin/tomcat.pid' }]
     tomcat_user 'vdash_user'
     tomcat_group 'vdash_group'
end




