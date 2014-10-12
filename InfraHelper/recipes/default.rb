#
# Copyright 2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
# http://aws.amazon.com/apache2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
#

include_recipe 'deploy'

node[:deploy].each do |application, deploy|
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
end