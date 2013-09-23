class emacs (
  $disable_backups = false,
  ) {
  case $operatingsystem {
    debian, ubuntu: {
      $elPath = "/etc/emacs/site-start.d"
      $elDep  = Package['emacsen-common']
      
      package { ['emacs23-nox', 'emacsen-common']:
        ensure => installed,
      }
    }
    centos, redhat: {
      $elPath = "/usr/share/emacs/site-lisp/site-start.d"
      $elDep  = Package['emacs-common'],
      
      package { ['emacs-nox', 'emacs-common']:
        ensure => installed,
      }
    }
  }

  if $disable_backups == true {
    file { "${elPath}/70nobackups.el":
      ensure  => file,
      owner   => root,
      group   => root,
      mode    => 644,
      require => $elDep,
      source  => "puppet:///modules/emacs/70nobackups.el",
    }
  }
  
}
              
                                   
