package "activemq" do 
  action :install
  version "5.5.0+dfsg-6ubuntu1.1"
end

link "/etc/activemq/instances-enabled/main" do
  action :create
  link_type :symbolic
  to "/etc/activemq/instances-available/main"
end

template "/etc/activemq/instances-available/main/activemq.xml" do
  source "activemq.xml.erb"
  mode 0644
  owner "root"
  group "root"
end


service "activemq" do
  action :start
end
