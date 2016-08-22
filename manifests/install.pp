# Class: Config::Install
# ======================
#
# Install packages
#
class configy::install {

  $packages = ['awesome','emacs','vim','spacefm','zsh','make','git', 'zathura', 'zathura-pdf-poppler']

  $packages.each | String $package | {
    package { $package: ensure => present }
    }

}
