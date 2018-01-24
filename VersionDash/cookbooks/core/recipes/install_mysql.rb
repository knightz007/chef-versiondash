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
mysql_service 'dash-db' do
  port '3306'
  version '5.5'
  initial_root_password 'changeme'
  action [:create, :start]
end