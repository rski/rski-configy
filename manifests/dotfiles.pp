# Class configy::dotfiles
# Installs my dotfiles for $user
class configy::dotfiles (
  $user  = 'rski',
  $email = 'rom.skiad@gmail.com',
) {

  $home = "/home/${user}"
  $dotfiles_path = "${home}/dotfiles"

  file { "${home}/Code":
    ensure => directory,
  }

  file { "${home}/.email":
    ensure   => file,
    contents => $email,
  }

  vcsrepo { $dotfiles_path:
    ensure   => present,
    provider => git,
    source   => 'https://gitlab.com/rski/dotfiles.git',
  }

  exec { 'make-dotfiles':
    cwd     => $dotfiles_path,
    command => '/usr/bin/make',
    creates => "/home/${user}/.spacemacs",
    user    => $user,
  }

  File["${home}/Code"] -> Vcsrepo[$dotfiles_path]
  File["${home}/.email"] -> Vcsrepo[$dotfiles_path]
  Vcsrepo[$dotfiles_path] -> Exec['make-dotfiles']

}
