#!/usr/bin/env perl

use Modern::Perl '2013';
use strict;
use warnings;

use File::Spec::Functions qw/ catfile /;

my $HOME       = $ENV{'HOME'};
my @LINKS = qw/
    .ghci
    .gitconfig
    .gvimrc
    .inputrc
    .irbrc
    .ocamlinit
    .perlcriticrc
    .perltidyrc
    .tmux.conf
    .vim
    .vimrc
    .zsh.local
/;

say 'Tearing down...';
foreach my $link (@LINKS) {
    unlink catfile( $HOME, $link );
}
say 'Done!';