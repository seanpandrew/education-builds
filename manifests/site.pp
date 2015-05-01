node default {
  class { 'staging':
    path  => '/usr/src/installer/',
    owner => 'root',
    group => 'root',
  }
  class { 'bootstrap::get_pe': 
    version => '3.8.0' 
  }
  class { 'bootstrap::get_32bit_agent': 
    version => '3.8.0' 
  }
  include epel
  include bootstrap
  include localrepo
  include training
}

node /student/ {
  include epel
  class { 'student': } 
}

node /lms/ {
  class { 'staging':
    path  => '/usr/src/installer/',
    owner => 'root',
    group => 'root',
  }
  include lms
}

node /learn/ {
  class { 'staging':
    path  => '/usr/src/installer/',
    owner => 'root',
    group => 'root',
  }
  class { 'bootstrap::get_pe': 
    version => '3.8.0' 
  }
  include epel
  include bootstrap
  include localrepo
  include learning
  include learning::install
  include learning::set_defaults
}

node /puppetfactory/ {
  class { 'staging':
    path  => '/usr/src/installer/',
    owner => 'root',
    group => 'root',
  }
  class { 'bootstrap::get_pe': 
    version => '3.8.0' 
  }  
  class { 'bootstrap::install_pe':}
  include epel
  include bootstrap
  include localrepo
}
