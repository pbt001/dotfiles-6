#!/usr/bin/env perl

#use Modern::Perl '2013';
#use autodie;
use strict;
use warnings;

use File::HomeDir qw/ home /;
use File::Spec::Functions qw/ catfile /;
#use Readonly;

#Readonly my @FILES = qw/
my @FILES = qw/
    .bash_profile
    .emacs
    .emacs.d
    .gitconfig
    .hgrc
    .inputrc
    .irbrc
    .ocamlinit
    .perlcriticrc
    .perltidyrc
    .screenrc
    .todo.cfg
    .tmux.conf
    .vim
    .vimrc
    .zshalias
    .zshenv
    .zshprompt
    .zshrc
    .zshscreen
/;

say 'Tearing down...';
foreach my $file (@FILES) {
    unlink catfile( home(), $file );
}
say 'Done!';
