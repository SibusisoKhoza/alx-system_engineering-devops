# 7-puppet_install_nginx_web_server.pp

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Configure Nginx server block for root with Hello World!
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => '
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm;

    server_name _;

    location / {
        try_files $uri $uri/ =404;
        add_header Cache-Control "no-store, no-cache, must-revalidate";
        add_header Pragma "no-cache";
        add_header Expires "Sat, 26 Jul 1997 05:00:00 GMT";
    }

    location = /redirect_me {
        return 301 /;
    }

    error_page 404 /404.html;
    location = /404.html {
        internal;
    }
}
',
  notify => Service['nginx'],
}

# Create index.html with Hello World!
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Create a directory for the 301 redirect page
file { '/var/www/html/redirect_me':
  ensure => directory,
}

# Apply the Puppet manifest
