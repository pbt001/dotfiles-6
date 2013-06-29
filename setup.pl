#!/usr/bin/env perl

#use Modern::Perl '2013';
#use autodie;
use 5.010;
use strict;
use warnings;

use Cwd;
use Env;
use File::Spec::Functions qw/ catfile /;

my $HOME       = $ENV{'HOME'};
my $DOTFILES   = getcwd();
my %MISC_LINKS = (
    bashalias    => '.bashalias',
    bashenv      => '.bashenv',
    bash_profile => '.bash_profile',
    #bashrc      => '.bashrc',
    emacs        => '.emacs',
    emacs_d      => '.emacs.d',
    gitconfig    => '.gitconfig',
    hgrc         => '.hgrc',
    inputrc      => '.inputrc',
    irbrc        => '.irbrc',
    ocamlinit    => '.ocamlinit',
    perlcriticrc => '.perlcriticrc',
    perltidyrc   => '.perltidyrc',
    #screenrc     => '.screenrc',
    #tmux_conf    => '.tmux.conf',
    vim          => '.vim',
    vimrc        => '.vimrc',
);

my %ZSH_LINKS = (
    zshalias     => '.zshalias',
    zshenv       => '.zshenv',
    zshprompt    => '.zshprompt',
    zshrc        => '.zshrc',
    zshscreen    => '.zshscreen',
);

say 'Setting up...';
say 'Misc files...';
while ( my ( $old, $new ) = each %MISC_LINKS ) {
    symlink catfile( $DOTFILES, $old ), catfile( $HOME, $new );
}
#say 'zsh files...';
#while ( my ( $old, $new ) = each %ZSH_LINKS ) {
    #symlink catfile( $DOTFILES, 'zsh', $old ), catfile( $HOME, $new );
#}
say 'Done!';
