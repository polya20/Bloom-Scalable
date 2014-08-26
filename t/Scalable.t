use Test::More tests => 4;
use Bloom::Scalable qw(new add contains);

BEGIN { use_ok( 'Bloom::Scalable' ); }
require_ok( 'Bloom::Scalable' );
open $fh, "</usr/share/dict/words" or die "couldn't open dict";
my @words = map { chomp; $_ } <$fh>;

# keeping the intial capacity low by choice so that 
# new filters get added as new words are added.
my $scalable_bloom = new Bloom::Scalable(0, 10);
foreach my $word ( @words[0..100] ) {
    $scalable_bloom->add($word);
}
# check the presence of a random word in the Bloom Filter
my $random_index = int(rand(100));
ok( $scalable_bloom->contains($words[$random_index]) == 1, "contains test");



# call DESTROY on the object to store it serialized in a file
undef $scalable_bloom; 

my $scalable_bloom_from_file = new Bloom::Scalable(undef);

# we did not add any new words check the presence of a random word in the Bloom Filter
# because it should have been created from the persisted file
my $random_index = int(rand(100));
ok( $scalable_bloom_from_file->contains($words[$random_index]) == 1, "contains test persisted bloom");
