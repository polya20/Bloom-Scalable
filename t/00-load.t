#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'Bloom::Scalable' ) || print "Bail out!\n";
    use_ok( 'Bloom::Simple' ) || print "Bail out!\n";
}

diag( "Testing Bloom::Scalable $Bloom::Scalable::VERSION, Perl $], $^X" );
