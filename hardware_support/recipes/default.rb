#
# Cookbook Name:: hardware_support
# Recipe:: default
#
# Copyright 2014, Biola University 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if node['platform_family'] == 'debian'
  # GPT parititioning support
  package 'gdisk'
  package 'sysstat'
  package 'iftop'
end


if node['platform_family'] == 'rhel'
  # ext4 support offically added in v5.6
  if node['platform_version'].to_f > 5.5
    package 'e4fsprogs'
  end
end
