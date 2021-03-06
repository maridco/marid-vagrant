$ar_databases = ['activerecord_unittest', 'activerecord_unittest2']
$as_vagrant   = 'sudo -u vagrant -H bash -l -c'
$as_root   = 'sudo -H bash -l -c'
$home         = '/home/vagrant'

# Pick a Ruby version modern enough, that works in the currently supported Rails
# versions, and for which RVM provides binaries.
$ruby_version = '2.1.1'

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

# --- Preinstall Stage ---------------------------------------------------------

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update':
    unless => "test -e ${home}/.rvm"
  }
}
class { 'apt_get_update':
  stage => preinstall
}

# --- Java -------------------------------------------------------------------

exec { 'add_oracle_repository':
  command => "${as_root} 'add-apt-repository ppa:webupd8team/java && apt-get update'",
}

exec { 'add_licence_oracle_jdk':
  command => "${as_root} 'echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections'",
}

package {'oracle-java7-installer':
  ensure => installed;
}

package {'libpq-dev':
  ensure => installed;
}

# --- SQLite -------------------------------------------------------------------

package { ['sqlite3', 'libsqlite3-dev']:
  ensure => installed;
}


# --- Packages -----------------------------------------------------------------

package { 'curl':
  ensure => installed
}

package { 'build-essential':
  ensure => installed
}

package { 'git-core':
  ensure => installed
}

# Nokogiri dependencies.
package { ['libxml2', 'libxml2-dev', 'libxslt1-dev']:
  ensure => installed
}

# ExecJS runtime.
package { 'nodejs':
  ensure => installed
}

# --- Postgresql ---------------------------------------------------------------------

class { 'postgresql::server': }

postgresql::server::db { 'marid':
  user     => 'marid',
  password => postgresql_password('marid', 'passw0rd'),
}

# --- Ruby ---------------------------------------------------------------------

exec { 'install_rvm':
  command => "${as_vagrant} 'curl -L https://get.rvm.io | bash -s stable --rails'",
  creates => "${home}/.rvm/bin/rvm",
  require => Package['curl'],
  timeout     => 2800
}

exec { 'install_stuff':
  command => "${as_vagrant} 'bundle install'"
}

exec { 'clone_vim_ruby':
  command => "${as_vagrant} 'git clone git://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby|| true'"
}

exec { 'clone_patogen':
  command => "${as_vagrant} 'mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim || true'"
}

exec { 'vimrc':
  command => "/usr/bin/wget -q https://raw.githubusercontent.com/turboMaCk/Dotfiles/master/server/.vimrc -O /home/vagrant/.vimrc",
  creates => "/home/vagrant/.vimrc",
}


# Needed for docs generation.
exec { 'update-locale':
  command => 'update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8'
}
