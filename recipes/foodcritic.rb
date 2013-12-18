#
# Author:: Stephen Lauck <lauck@opscode.com>
# Author:: Mauricio Silva <msilva@exacttarget.com>
#
# Cookbook Name:: pipeline
# Recipe:: default
#
# Copyright 2013, Exact Target
# Copyright 2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform']
when 'redhat', 'centos', 'scientific', 'fedora', 'suse', 'amazon', 'oracle'
    # install some depends
  %w{libxml2 libxml2-devel libxslt libxslt-devel rubygem-nokogiri}.each do |pkg|
    package pkg
  end
when 'ubuntu', 'debian'
  # install some depends
  %w{libxslt-dev libxml2-dev}.each do |pkg|
    package pkg
  end
end

# install foodcritic gem
gem_package "foodcritic" do
  gem_binary("/opt/chef/embedded/bin/gem")
  version "3.0.3"
end
