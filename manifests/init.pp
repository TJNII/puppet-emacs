class emacs {
  package { ['emacs23-nox', 'emacsen-common']:
    ensure => installed,
  }
  
  file { "/etc/emacs/site-start.d/70nobackups.el":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => 644,
    require => Package['emacsen-common'],
    source  => "puppet:///modules/emacs/70nobackups.el",
  }
}
              
                                   
