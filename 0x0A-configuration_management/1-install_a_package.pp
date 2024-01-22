# 1-install_a_package.pp

# Ensure the package resource type is available
include ::apt

# Define a package resource for Flask with the specified version
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Class['apt'],
}
