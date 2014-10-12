#
# Cookbook Name:: InfraHelper
# Recipe:: IHQueueWatcher.rb
#
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

template "IHQueueConfig.yml" do
  path "##{deploy[:current_path]}/IHQueueConfig.yml"
  source "IHQueueConfig.yml.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
   :myQueue         => (deploy[:environment][:IHqueue] rescue nil),
   :myRegion        => (opsworks[:instance][:region] rescue nil)
  )
  backup false
end

template "infrahelper.json" do
  path "##{deploy[:current_path]}/infrahelper.json"
  source "infrahelper.json.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
   :myDomain         => (deploy[:environment][:myDomain] rescue nil)
  )
  backup false
end

