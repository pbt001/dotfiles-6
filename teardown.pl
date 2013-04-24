#!/usr/bin/env perl

use 5.016;
use strict;
use warnings;
use autodie;
use File::HomeDir qw/ home /;
use File::Spec::Functions qw/ catfile /;
use Readonly;

Readonly my @FILES = (
    '.bash_profile', '.emacs',     '.emacs.d',   '.gitconfig',
    '.hgrc',         '.irbrc',     '.ocamlinit', '.perltidyrc',
    '.screenrc',     '.tmux.conf', '.vim',       '.vimrc',
    '.zshalias',     '.zshenv',    '.zshprompt', '.zshrc',
    '.zshscreen',
);

foreach my $file (@FILES) {
    unlink catfile( home(), $file );
}

