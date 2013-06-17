execute "install puppetlabs apt repository" do
  command "wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb -O /tmp/puppetlabs-release-precise.deb ; dpkg -i /tmp/puppetlabs-release-precise.deb ; apt-get update"
  not_if { ::File.exists? "/etc/apt/sources.list.d/puppetlabs.list" }
end
