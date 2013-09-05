class emacs {
  case $operatingsystem {
    debian, ubuntu: {
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
    centos, redhat: {
      package { ['emacs-nox', 'emacs-common']:
        ensure => installed,
      }

      file { "/usr/share/emacs/site-lisp/site-start.d/nobackups.el":
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 644,
        require => Package['emacs-common'],
        source  => "puppet:///modules/emacs/70nobackups.el",
      }
      
    }
  }
  
}
              
                                   
