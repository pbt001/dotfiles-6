#!/usr/bin/env perl

use Modern::Perl '2013';
use autodie;
use Readonly;


Readonly my $FILES = {
    bash_profile    => '.bash_profile',
    emacs           => '.emacs',
    emacs_d         => '.emacs.d',
    gitconfig
    hgrc
    irbrc
    ocamlinit
    perltidyrc
    screenrc
    tmux_conf
    vim
    vimrc
    zsh
}
