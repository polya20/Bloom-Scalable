use Test::More tests => 6;
use Bloom::Simple;
use Data::Dumper;

BEGIN { use_ok( 'Bloom::Simple' ); }
require_ok( 'Bloom::Simple' );
my $key = "bingo";
my $simple_bloom = new Bloom::Simple(1);
$simple_bloom->add($key);
ok( $simple_bloom->contains($key) == 1, "contains test");
ok( $simple_bloom->contains("random_string") != 1,  "doesn't contain test");

#Check utf8 characters
my $utf8_string = "I \x{2665} NY";
$simple_bloom->add($utf8_string);
ok( $simple_bloom->contains($utf8_string) == 1, "contains utf8 test");

# Setting fresh instance while creating simple bloom should
# not serialize the object 
undef $simple_bloom;
my $simple_bloom_new = new Bloom::Simple();
ok( $simple_bloom_new->contains("bingo") != 1,  "new object doesn't contain test");

