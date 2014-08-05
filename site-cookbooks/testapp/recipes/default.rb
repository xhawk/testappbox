#
# Cookbook Name:: testapp
# Recipe:: default
#
# Copyright 2014, Siili Solutions oyj
#
# All rights reserved - Do Not Redistribute
#

iptables_ng_rule 'ssh' do
  rule '--protocol tcp --dport 8080 --match state --state NEW --jump ACCEPT'
end

git "/home/vagrant/testapp" do 
	repository 	"git@github.com:xhawk/testapp.git"
	revision 	"master"
	action 		:sync
	user 		"vagrant"
end

execute "testapp" do
	command "node server.js &"
	cwd 	"/home/vagrant/testapp"
end
