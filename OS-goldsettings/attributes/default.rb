# This is a Chef attributes file. It can be used to specify default and override
# attributes to be applied to nodes that run this cookbook.

# Set a default name
default['OS-goldsettings']['config']['etc_dir'] = '/etc'
default['OS-goldsettings']['config']['user'] = 'root'
default['OS-goldsettings']['config']['group'] = 'root'

# For further information, see the Chef documentation (https://docs.chef.io/essentials_cookbook_attribute_files.html).
