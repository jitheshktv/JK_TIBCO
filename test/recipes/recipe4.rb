envinfo_file = '/tmp/testing'
tibco_home_name = 'TIBCO_HOME'
node.default[:stringfound] = nil

file envinfo_file do
  content "name=\"TIBCO_HOME\""
end

ruby_block 'check if TIBCOEnvInfo exists' do
  block do
    if File.readlines(envinfo_file).grep(/"#{tibco_home_name}"/).any?
      node.set[:stringfound] = 'true'
      print "file contains #{tibco_home_name}"
    else
      node.set[:stringfound] = 'false'
      print "file DOESNT contain #{tibco_home_name}"
    end
  end
  only_if { File.exist?(envinfo_file) }
end

stringfound1 = node[:stringfound]

template '/tmp/stringfound' do
  source 'testingGrep.erb'
  variables(
    var_stringfound1: stringfound1
  )
  mode '0777'
end

directory "/tmp/#{stringfound1}"
