#!/usr/bin/env perl

use Modern::Perl '2013';
use autodie;

use File::HomeDir qw/ home /;
use File::Spec::Functions qw/ catfile /;
use Readonly;

Readonly my @FILES = qw/
    .bash_profile
    .emacs
    .emacs.d
    .gitconfig
    .hgrc
    .irbrc
    .ocamlinit
    .perltidyrc
    .screenrc
    .tmux.conf
    .vim
    .vimrc
    .zshalias
    .zshenv
    .zshprompt
    .zshrc
    .zshscreen
/;

foreach my $file (@FILES) {
    unlink catfile( home(), $file );
}

