#
# Cookbook Name:: lastpass
# Recipe:: default
#
# Copyright 2013, Protec Innovations
#
# Distributed under BSD licence
#

unless File.exists? "/tmp/lpinstall/lpchrome_linux.crx" do
    remote_file "/tmp/lplinux.tar.bz2" do
        source "https://lastpass.com/lplinux.tar.bz2"
        mode 0644
        checksum "79f632b80cf08667439ea2a8655fc10054836b2ba0a52087ace50dbd08b72206"
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
end
