maintainer       "Biola University"
maintainer_email "itsysadmins@biola.edu"
license          "Apache 2.0"
description      "Encapsulates splunk cookbook; offers monitor configuration for Splunk forwarders"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"
depends          "splunk"
%w{redhat centos fedora debian ubuntu}.each do |os|
  supports os
end
