# = Class: hosts
#
# Manages hosts file
#
# == Parameters
#
# [*source*]
#   Sets the content of source parameter for main hosts file
#   If defined, hosts file will have the param: source => $source
#
# [*template*]
#   Sets the path to the template to use as content for main hosts file
#   If defined, hosts file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#
# == Author
#   Matthew Schmitt <mschmitt@sugarsync.com/>
#
class hosts (
  $source = $hosts::params::source,
  $template = $hosts::params::template,
) inherits hosts::params {

  $manage_file_source = $source ? {
    ''      => undef,
    default => $source,
  }

  $manage_file_content = $template ? {
    ''      => undef,
    undef   => undef,
    default => template($template),
  }
  file { '/etc/hosts':
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    source  => $manage_file_source,
    content => $manage_file_content,
  }
}

