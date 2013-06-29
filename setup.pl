#!/usr/bin/env perl

use Modern::Perl '2013';
use 5.010;
use strict;
use warnings;

use Cwd;
use Env;
use File::Spec::Functions qw/ catfile /;

my $HOME       = $ENV{'HOME'};
my $DOTFILES   = getcwd();
my %MISC_LINKS = (
    ghci        =>  '.ghci',
    gitconfig    => '.gitconfig',
    inputrc      => '.inputrc',
    irbrc        => '.irbrc',
    ocamlinit    => '.ocamlinit',
    perlcriticrc => '.perlcriticrc',
    perltidyrc   => '.perltidyrc',
    tmux_conf    => '.tmux.conf',
    vimrc_after  => '.vimrc.after',
);

say 'Setting up...';
say 'Misc files...';
while ( my ( $old, $new ) = each %MISC_LINKS ) {
    symlink catfile( $DOTFILES, $old ), catfile( $HOME, $new );
}
say 'Done!';
