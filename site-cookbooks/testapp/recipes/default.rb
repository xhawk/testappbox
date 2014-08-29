#
# Cookbook Name:: testapp
# Recipe:: default
#
# Copyright 2014, Siili Solutions oyj
#
# All rights reserved - Do Not Redistribute
#

# avaa portti 8080 ulkoapäin tulevalle liikenteelle
#iptables_ng_rule 'ssh' do
#  rule '--protocol tcp --dport 8080 --match state --state NEW --jump ACCEPT'
#end

execute "disable fingerprint" do 
	command "echo \"Host github.com\n\tStrictHostKeyChecking no\n\" >> /home/vagrant/.ssh/config"
	cwd		"/home/vagrant"
	user 	"vagrant"
end

# pullaa testapp githubista
git "/home/vagrant/testapp" do 
	repository 		"git@github.com:xhawk/testapp.git"
	revision		"HEAD"
	action 			:sync
	user 			"vagrant"
end

# aja node install
execute "npm install" do
	command "npm install"
	cwd		"/home/vagrant/testapp"
end

# käynnistä serveri vm:ssä
execute "gulp" do
	command "npm install -g gulp"
	cwd 	"/home/vagrant/testapp"
end

execute "run gulp" do
	command "nohup gulp &"
	cwd		"/home/vagrant/testapp"
end
