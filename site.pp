## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes or call it by its name when they have a specific task
  # Example:
  #   class { 'my_class': }
include ::sysops
#package { 'zsh': }
}

#import 'sysops' #import is being retired use directory instead
#####################################################################################
# the lines bellow add the new shell to all nodes, change the default shell 
# to the new one we just installed and copies the new customized prompt for 
# the user (mgn in this case)
#
####################################################################################
#package { 'zsh': }
#exec { 'change_shell':                    # exec resource named 'change_shell'
#  command => '/usr/bin/chsh -s /usr/bin/zsh mgn'  # command this resource will run
#}
#file { '.zshrc':                                # file resource name
#   path => '/home/mgn/',               # destination path
#   ensure => file,
#   source => 'puppet:///modules/sysops/.zshrc',  # specify location of file to be copied
# }

