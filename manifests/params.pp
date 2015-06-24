# = Class: hosts::params
#
# == Variables
#
# Refer to hosts class for variables defined here
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class hosts::params {
  $source = ''
  $template = 'hosts/hosts.erb'
}
