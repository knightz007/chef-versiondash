  # yum_repository 'mysql56-community' do
  #   mirrorlist 'https://repo.mysql.com/yum/mysql-5.6-community/el/7/x86_64/'
  #   description ''
  #   enabled true
  #   gpgcheck true
  # end


#  cookbook_file '/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql' do
#   source 'gpu-mysql-key'
#   owner 'root'
#   group 'root'
#   mode '0644'
#   action :create
# end

#  yum_repository 'mysql56-community' do
#     baseurl 'https://repo.mysql.com/yum/mysql-5.6-community/el/$releasever/$basearch/'
#     description 'MySQL 5.6 Community Server'
#     enabled true
#     gpgcheck true
#  end


 cookbook_file '/tmp/vDash.sql' do
  source 'testdbcreation.sql'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file '/tmp/grants.sql' do
  source 'grants.sql'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

mysql_service 'dash-db' do
  port '3306'
  bind_address '0.0.0.0'
  version '5.5'
  initial_root_password 'change_me'
  action [:create, :start]
end

execute 'Create vDash DB' do
  user 'root'
  command "mysql -h #{node['hostname']} -u root -p'change_me' < /tmp/vDash.sql"
end

execute 'Create dash user and grant privileges' do
  user 'root'
  command "mysql -h #{node['hostname']} -u root -p'change_me' < /tmp/grants.sql"
end



