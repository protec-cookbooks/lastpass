#
# Cookbook Name:: lastpass
# Recipe:: default
#
# Copyright 2013, Protec Innovations
#
# Distributed under BSD licence
#

unless File.exists? "/tmp/lpinstall/lpchrome_linux.crx"
    remote_file "/tmp/lplinux.tar.bz2" do
        source "https://lastpass.com/lplinux.tar.bz2"
        mode 0644
        checksum "d656d2740d5f4125145e042fd6dbec80bfc466db4e31e9e6ebf2fcfe2cd1c319"
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
