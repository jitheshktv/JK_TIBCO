#
# Cookbook Name:: test
# Recipe:: recipe3
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

template '/tmp/testingfile' do
  source 'hawkagent.tra.erb'
end

ruby_block 'configure tibcoadmin_domain.tra' do
  block do
    administrator_tra_file = Chef::Util::FileEdit.new("/tmp/testingfile")
    administrator_tra_file.search_file_replace_line('java.heap.size.min', "java.heap.size.min=1024")
    administrator_tra_file.insert_line_if_no_match('java.heap.size.min', "java.heap.size.min=1024")
    administrator_tra_file.search_file_replace_line('java.heap.size.max', "java.heap.size.max=2048")
    administrator_tra_file.insert_line_if_no_match('java.heap.size.max', "java.heap.size.max=2048")
    administrator_tra_file.search_file_replace_line('java.property.java.io.tmpdir', "java.property.java.io.tmpdir=/tmp")
    administrator_tra_file.insert_line_if_no_match('java.property.java.io.tmpdir', "java.property.java.io.tmpdir=/tmp")
    administrator_tra_file.write_file
  end
end

version = node['test']['version']

print "version is #{version}"

if version >= '5.0'
  print "version is greater than or equal to 5.0"
else
  print "version is less than 5.0"
end
