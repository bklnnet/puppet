# Class: sysops
# ===========================
#
# First puppet module just to explain basic concepts to new guys
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'sysops':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Mark Naumowicz <mark@naumowicz.net>
#
# Copyright
# ---------
#
# Copyright 2017 JollyBuyInc, unless otherwise noted.
#
class sysops {

#####################################################################################
# the lines bellow add the new shell to all nodes, 
# change the default shell to the new one we just installed, 
# copy the new customized prompt for the user (mgn in this case) 
####################################################################################

package { 'zsh': 
  ensure => 'latest',
}

package { 'htop': 
  ensure => 'latest',
}

exec { 'change_shell':				   # we just named that resource 'change_shell'
  command => '/usr/bin/chsh -s /usr/bin/zsh mgn'  # command this resource will run
}

file { '.zshrc':                                # file resource name
   path => '/home/mgn/.zshrc',               # destination path
   ensure => file,
   source => 'puppet:///modules/sysops/.zshrc',  # specify location of file to be copied
   }

file { 'stest':
	path => '/bin/stest',
	ensure => file,
	source => 'puppet:///modules/sysops/stest',
	mode => '0755',
	}

}
