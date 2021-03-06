# user
default["sensu"]["user"] = "sensu"
default["sensu"]["group"] = "sensu"

# platform
if platform_family?("windows")
  default["sensu"]["admin_user"] = "Administrator"
  default["sensu"]["directory"] = 'C:\etc\sensu'
  default["sensu"]["log_directory"] = 'C:\var\log\sensu'
  default["sensu"]["windows"]["package_options"] = nil
  default["sensu"]["windows"]["install_dotnet"] = true
  default["sensu"]["windows"]["dotnet_major_version"] = 4
else
  default["sensu"]["admin_user"] = "root"
  default["sensu"]["directory"] = "/etc/sensu"
  default["sensu"]["log_directory"] = "/var/log/sensu"
end

# installation
default["sensu"]["version"] = "1.2.0-1"
default["sensu"]["version_suffix"] = nil
default["sensu"]["apt_repo_codename"] = nil
default["sensu"]["yum_repo_releasever"] = nil
default["sensu"]["use_unstable_repo"] = false
default["sensu"]["log_level"] = "info"
default["sensu"]["log_rotate_file_size"] = 10240
default["sensu"]["log_rotate_file_keep"] = 10
default["sensu"]["use_ssl"] = true
default["sensu"]["use_embedded_ruby"] = true
default["sensu"]["service_max_wait"] = 10
default["sensu"]["directory_mode"] = "0750"
default["sensu"]["log_directory_mode"] = "0750"
default["sensu"]["client_deregister_on_stop"] = false
default["sensu"]["client_deregister_handler"] = nil
# URL to the installation package (e.g. in S3)
default['sensu']['aws_linux_2_package_url'] = ''
default['sensu']['ubuntu_package_url'] = ''

default["sensu"]["apt_repo_url"] = "http://eol-repositories.sensuapp.org/apt"
default["sensu"]["yum_repo_url"] = "http://eol-repositories.sensuapp.org"
default['sensu']['msi_repo_url'] = "https://eol-repositories.sensuapp.org/msi"
default['sensu']['yum_flush_cache'] = nil
default["sensu"]["aix_package_root_url"] = "https://eol-repositories.sensuapp.org/aix"
default["sensu"]["add_repo"] = true
default['sensu']['apt_key_url'] = 'https://eol-repositories.sensuapp.org/apt/pubkey.gpg'
default['sensu']['yum_key_url'] = 'https://eol-repositories.sensuapp.org/yum/pubkey.gpg'

# transport
default["sensu"]["transport"]["reconnect_on_error"] = true
default["sensu"]["transport"]["name"] = 'rabbitmq'

# rabbitmq
default["sensu"]["rabbitmq"]["hosts"] = []
default["sensu"]["rabbitmq"]["host"] = "localhost"
default["sensu"]["rabbitmq"]["port"] = 5671
default["sensu"]["rabbitmq"]["vhost"] = "/sensu"
default["sensu"]["rabbitmq"]["user"] = "sensu"
default["sensu"]["rabbitmq"]["password"] = "password"

# redis
default["sensu"]["redis"]["host"] = "localhost"
default["sensu"]["redis"]["port"] = 6379
default["sensu"]["redis"]["reconnect_on_error"] = true

# api
default["sensu"]["api"]["host"] = "localhost"
default["sensu"]["api"]["bind"] = "0.0.0.0"
default["sensu"]["api"]["port"] = 4567

# data bag
default["sensu"]["data_bag"]["name"] = "sensu"
default["sensu"]["data_bag"]["ssl_item"] = "ssl"
default["sensu"]["data_bag"]["config_item"] = "config"
default["sensu"]["data_bag"]["enterprise_item"] = "enterprise"
