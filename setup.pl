#!/usr/bin/env perl

#use Modern::Perl '2013';
#use autodie;
use strict;
use warnings;

use Cwd;
use File::HomeDir qw/ home /;
use File::Spec::Functions qw/ catfile /;
#use Readonly;

#Readonly my %FILES = (
my %FILES = (
    bash_profile => '.bash_profile',
    emacs        => '.emacs',
    emacs_d      => '.emacs.d',
    gitconfig    => '.gitconfig',
    hgrc         => '.hgrc',
    inputrc      => '.inputrc',
    irbrc        => '.irbrc',
    ocamlinit    => '.ocamlinit',
    perlcriticrc => '.perlcriticrc',
    perltidyrc   => '.perltidyrc',
    screenrc     => '.screenrc',
    tmux_conf    => '.tmux.conf',
    todo_cfg     => '.todo.cfg',
    vim          => '.vim',
    vimrc        => '.vimrc',
    zshalias     => '.zshalias',
    zshenv       => '.zshenv',
    zshprompt    => '.zshprompt',
    zshrc        => '.zshrc',
    zshscreen    => '.zshscreen',
);

say 'Setting up...';
while ( my ( $old, $new ) = each %FILES ) {
    symlink catfile( getcwd(), $old ), catfile( home(), $new );
}
say 'Done!';
