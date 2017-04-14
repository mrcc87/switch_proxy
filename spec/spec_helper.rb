require 'fileutils'
#create temporary folder to use as test home
FileUtils.mkdir_p('/tmp/switch_proxy_test/home')
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
ENV['HOME'] = '/tmp/switch_proxy_test/home'
require 'switch_proxy'
