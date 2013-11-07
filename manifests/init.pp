# Copyright 2013 Tom Noonan II (TJNII)
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
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
      $elDep  = Package['emacs-common']
      
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
              
                                   
