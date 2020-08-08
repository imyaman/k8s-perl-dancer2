#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Dancer2;

get '/' => sub {
    template 'index';
};

dance;
