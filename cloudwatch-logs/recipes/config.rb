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

template "/etc/cwlogs.cfg" do
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
		:myFile         => (node[:opsworks][:stack][:name] rescue nil),
		:logGroup				=> (node[:opsworks][:stack][:name].gsub(' ','_') rescue nil)
	)
	backup false
end

include_recipe "install"