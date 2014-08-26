use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Bloom::Scalable',
    AUTHOR           => q{Subhojit Banerjee <subhojit20@gmail.com>},
    VERSION_FROM     => 'lib/Bloom/Scalable.pm',
    ABSTRACT_FROM    => 'lib/Bloom/Scalable.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
        'Digest::MurmurHash' => 0,
        'MCE::Grep' => 0,
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Bloom-Scalable-*' },
    (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {
    'meta-spec' => { version => 2 },
     resources => {
         repository => {
             type => 'git',
             url  => 'https://github.com/polya20/Bloom-Scalable.git',
             web  => 'https://github.com/polya20/Bloom-Scalable',
         },
     }})
     : ()
   ),
);
