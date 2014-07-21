#!perl
### Test that the module(s) load!(s)
use	Test::More;
use	Test::Requires "v5.10";
BEGIN{ use_ok( version ) };
BEGIN{ use_ok( Test::Moose ) };
BEGIN{ use_ok( Moose ) };
BEGIN{ use_ok( Moose::Meta::Class ) };
BEGIN{ use_ok( Data::Dumper ) };
BEGIN{ use_ok( Carp, 'cluck' ) };
BEGIN{ use_ok( Moose::Exporter ) };
BEGIN{ use_ok( Type::Tiny, 0.046 ) };
BEGIN{ use_ok( Type::Utils, '-all' ) };
BEGIN{ use_ok( Types::Standard, '-types' ) };
BEGIN{ use_ok( Type::Library,
	'-base',
	'-declare' => qw(
		NameSpace
		SuperClassesList
		RolesList
		Attributes
		Methods
		BuildClassDict
	) ) };
use lib '../lib', 'lib',;
BEGIN{ use_ok( MooseX::ShortCut::BuildInstance::Types, 1.016 ) };
BEGIN{ use_ok( MooseX::ShortCut::BuildInstance, 1.016 ) };
done_testing();