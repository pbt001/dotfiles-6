#!/usr/bin/env perl

#use Modern::Perl '2013';
#use autodie;
use 5.010;
use strict;
use warnings;

use File::Spec::Functions qw/ catfile /;

my $HOME       = $ENV{'HOME'};
my @LINKS = qw/
    .bashalias
    .bashenv
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
    .vim
    .vimrc
/;

my @removed = qw/
    .screenrc
    .tmux.conf
    .zshalias
    .zshenv
    .zshprompt
    .zshrc
    .zshscreen
/;


say 'Tearing down...';
foreach my $link (@LINKS) {
    unlink catfile( $HOME, $link );
}
say 'Done!';
