name             "xfs"
maintainer       "Chef Software, Inc."
maintainer_email "cookbooks@chef.io"
license          "Apache 2.0"
description      "Installs packages for working with XFS"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.0"

recipe "xfs", "Installs packages for working with XFS"

%w{ amazon debian ubuntu redhat centos scientific fedora }.each do |os|
  supports os
end
