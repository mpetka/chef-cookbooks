#
# Cookbook Name:: directory_management
# Recipe:: win_dirs
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

if node['windows']
  if node['windows']['directories']
    # Read the attributes for the node's specified shares and create them
    node['windows']['directories'].each_pair do |dir,config|
      directory dir do
        config['rights'].each_pair do |principal,permission|
          unless permission.is_a?(Array)
            rights permission.to_sym, principal
          else
            rights permission[0].to_sym, principal, permission[1]
          end
        end
        if config['disable_inherits']
          inherits false
        end
      end
    end
  end
end
