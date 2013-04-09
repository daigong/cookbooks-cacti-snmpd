#
# Cookbook Name:: cookbooks-cacti-snmpd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "snmpd" do
  action :install
  options "--force-yes"
end

template "/etc/snmp/snmpd.conf" do
  source "snmpd.conf.erb"
  variables(
    :cacti_ip => node[:cacti_host_ip],
  )
end

service "snmpd" do
  action [:enable,:restart]
end
