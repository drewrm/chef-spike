package "ruby-stomp" do 
  action :install
  version "1.2.2-1"
end

%w{mcollective-client mcollective-common mcollective}.each do |pkg|
  package pkg do
    action :install
    version "2.2.4-1"
  end
end

template "/etc/mcollective/server.cfg" do
  source "server.cfg.erb"
  mode 0600
  owner "root"
  group "root"
end

template "/etc/mcollective/client.cfg" do
  source "client.cfg.erb"
  mode 0600
  owner "root"
  group "root"
end

service "mcollective" do 
  action :start
end

execute "test mco" do
  command "mco ping"
end
