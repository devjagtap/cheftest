require "net/http"

package 'httpd' do
  action :install
end

publicip = Net::HTTP.get(URI("https://api.ipify.org"))

file '/var/www/html/index.html' do
  content "<h1>Hello World!</h1>
  <h2>HOSTNAME: #{node['hostname']}</h2>
  <h2>IPADDRESS: #{node['ipaddress']}</h2>
  <h2>Public IPADDRESS: #{publicip}
  "
end

service 'httpd' do
  action [ :enable, :start ]
end

