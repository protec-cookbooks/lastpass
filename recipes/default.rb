#
# Cookbook Name:: lastpass
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/lplinux.tar.bz2" do
    source "https://lastpass.com/lplinux.tar.bz2"
    mode 0644
    checksum "691b35ab673c7d1833833e088ab1c1adfcae16182ab5b09a51c3eafd1483abf6"
end

directory "/tmp/lpinstall" do
    owner "root"
    group "root"
    mode 00755
    action :create
end

script "install-lastpass" do
    interpreter "bash"
    code <<-EOH
        tar -jxf /tmp/lplinux.tar.bz2 -C /tmp/lpinstall
        /tmp/lpinstall/install_lastpass.sh
    EOH
end
