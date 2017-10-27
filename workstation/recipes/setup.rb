package 'tree' do
  action :install
end

package 'emacs'

package 'ntp'

package 'git' 

#node['ipaddress']
#node['memory']['total']

# print statement 'I have 4 apples'
apple_count = 4
puts "I have #{apple_count} apples"

file '/etc/motd' do
  content "this server is property of your Namdev
  HOSTNAME: #{node['hostname']}
  IPADDRESS: #{node['ipaddress']}
  CPU: #{node['cpu']['0']['mhz']} 
  MEMORY: #{node['memory']['total']}
 
"
  owner 'root'
  group 'root'
end

service 'ntpd' do
  action [ :enable, :start ]
end
