
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Device and library agnostic color spaces.',
  'AUTHOR' => 'Cory G Watson <gphat@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0',
    'Test::Number::Delta' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Graphics-Color',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Graphics::Color',
  'PREREQ_PM' => {
    'Color::Library' => '0',
    'Moose' => '0',
    'Moose::Role' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::Aliases' => '0.10',
    'MooseX::Clone' => '0',
    'MooseX::Storage::Deferred' => '0',
    'MooseX::Types' => '0',
    'MooseX::Types::Moose' => '0'
  },
  'VERSION' => '0.29',
  'test' => {
    'TESTS' => 't/*.t t/author/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



