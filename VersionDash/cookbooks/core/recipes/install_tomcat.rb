# make sure we have java installed
include_recipe 'core::install_java'

user 'chefed'

# put chefed in the group so we can make sure we don't remove it by managing cool_group
group 'vdash_group' do
  members 'chefed'
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
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'tomcat_service[vdash]'
end

# start the helloworld tomcat service using a non-standard pic location
# tomcat_service 'vdash' do
#   action [:start, :enable]
#   env_vars [{ 'CATALINA_BASE' => '/opt/tomcat_vdash/' }, { 'CATALINA_PID' => '/opt/tomcat_helloworld/bin/non_standard_location.pid' }, { 'SOMETHING' => 'some_value' }]
#   sensitive true
#   tomcat_user 'cool_user'
#   tomcat_group 'cool_group'
# end

tomcat_service 'vdash' do
   action [:start, :enable]
     env_vars [{ 'CATALINA_PID' => '/opt/tomcat_vdash/bin/tomcat.pid' }]
     tomcat_user 'vdash_user'
     tomcat_group 'vdash_group'
end