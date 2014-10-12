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

#execute "disable fingerprint" do 
#	command "echo \"Host github.com\n\tStrictHostKeyChecking no\n\" >> /home/#{node[:user]}/.ssh/config"
#	cwd		"/home/#{node[:user]}"
#	user 	"#{node[:user]}"
#end

deploy_key "github_rsa" do
  provider Chef::Provider::DeployKeyGithub
  path '/home/ubuntu/.ssh'
  credentials({
    :token => 'ce1da235be29ea79046a614807bead13d7fbcbcd'
  })
  repo 'xhawk/testapp'
  owner 'ubuntu'
  group 'ubuntu'
  mode 00640
  action :add
end

# pullaa testapp githubista
#git "/home/#{node[:user]}/testapp" do 
#	repository 		"git@github.com:xhawk/testapp.git"
#	revision		"HEAD"
#	action 			:sync
#	user 			"#{node[:user]}"
#end

# aja node install
execute "npm install" do
	command "npm install"
	cwd		"/home/#{node[:user]}/testapp"
end

# käynnistä serveri vm:ssä
execute "gulp" do
	command "npm install -g gulp"
	cwd 	"/home/#{node[:user]}/testapp"
end

execute "run gulp" do
	command "nohup gulp &"
	cwd		"/home/#{node[:user]}/testapp"
end
