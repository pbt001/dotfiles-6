#!/usr/bin/env perl

use Modern::Perl '2013';
use autodie;

use Cwd;
use File::HomeDir qw/ home /;
use File::Spec::Functions qw/ catfile /;
use Readonly;

Readonly my %FILES = (
    bash_profile => '.bash_profile',
    emacs        => '.emacs',
    emacs_d      => '.emacs.d',
    gitconfig    => '.gitconfig',
    hgrc         => '.hgrc',
    irbrc        => '.irbrc',
    ocamlinit    => '.ocamlinit',
    perltidyrc   => '.perltidyrc',
    screenrc     => '.screenrc',
    tmux_conf    => '.tmux.conf',
    vim          => '.vim',
    vimrc        => '.vimrc',
    zshalias     => '.zshalias',
    zshenv       => '.zshenv',
    zshprompt    => '.zshprompt',
    zshrc        => '.zshrc',
    zshscreen    => '.zshscreen',
);

while ( my ( $old, $new ) = each %FILES ) {
    symlink catfile( getcwd(), $old ), catfile( home(), $new );
}
