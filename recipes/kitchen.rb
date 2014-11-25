include_recipe "build-essential"

# chef_gem "kitchen-ec2" do
#   action :install
# end

execute "chef gem install kitchen-ec2"

file "#{node['jenkins']['master']['home']}/.kitchen/config.yml" do
  content <<-EOD
---
driver:
  name: digitalocean
  EOD
  owner node['jenkins']['master']['user']
  group node['jenkins']['master']['user']
end