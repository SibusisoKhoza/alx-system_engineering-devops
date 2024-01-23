# install_flask.pp

# Ensure python3.8 is installed
package { 'python3.8':
  ensure => installed,
}

# Ensure pip3 is installed
package { 'python3-pip':
  ensure => installed,
}

# Install Flask version 2.1.0 and Werkzeug version 2.1.1 using pip3
exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0 Werkzeug==2.1.1',
  path    => '/usr/local/bin:/usr/bin:/bin',
  require => [Package['python3.8'], Package['python3-pip']],
}
