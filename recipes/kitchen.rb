include_recipe "build-essential"

chef_gem "kitchen-ec2" do
  action :install
end

