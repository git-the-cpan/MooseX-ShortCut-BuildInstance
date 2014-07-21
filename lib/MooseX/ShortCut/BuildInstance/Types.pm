package MooseX::ShortCut::BuildInstance::Types;
BEGIN {
  $MooseX::ShortCut::BuildInstance::Types::AUTHORITY = 'cpan:JANDREW';
}
use version; our $VERSION = qv("v1.18.2");
use strict;
use warnings;
use Type::Utils 0.046 -all;
use Type::Library 0.046
	-base,
	-declare => qw(
		NameSpace
		SuperClassesList
		RolesList
		Attributes
		Methods
		BuildClassDict
	);
use Types::Standard 0.046 -types;
if( $ENV{ Smart_Comments } ){
	use Smart::Comments -ENV;#'###'
	### Smart-Comments turned on for MooseX-ShortCut-BuildInstance-Types ...
}


#########1 Package Variables  3#########4#########5#########6#########7#########8#########9



#########1 Type Library       3#########4#########5#########6#########7#########8#########9

declare NameSpace,
	as Str,
    where{ $_ =~ /^[A-Za-z:]+$/ },
	message{ "-$_- does not match: " . qr/^[A-Za-z:]+$/ };
	
declare SuperClassesList,
	as ArrayRef[ ClassName ],
	where{ scalar( @$_ ) > 0 };
	
declare RolesList,
	as ArrayRef[ RoleName ],
	where{ scalar( @$_ ) > 0 };
	
declare Attributes,
	as HashRef[ HashRef ],
	where{ scalar( keys %$_ ) > 0 };
	
declare Methods,
	as HashRef[ CodeRef ],
	where{ scalar( keys %$_ ) > 0 };
	
declare BuildClassDict,
	as Dict[
		package					=> Optional[ NameSpace ],
		superclasses			=> Optional[ SuperClassesList ],
		roles					=> Optional[ RolesList ],
		add_roles_in_sequence	=> Optional[ RolesList ],
		add_attributes			=> Optional[ Attributes ],
		add_methods				=> Optional[ Methods ],
	],
	where{ scalar( keys %$_ ) > 0 };

#########1 Declared Coercions 3#########4#########5#########6#########7#########8#########9



#########1 Private Methods    3#########4#########5#########6#########7#########8#########9



#########1 Phinish            3#########4#########5#########6#########7#########8#########9
	
1;

#########1 Documentation      3#########4#########5#########6#########7#########8#########9
__END__

=head1 NAME

MooseX::ShortCut::BuildInstance::Types - The BuildInstance type library
    
=head1 DESCRIPTION

This is the package for managing types in the L<MooseX::ShortCut::BuildInstance> 
package.

=head2 Types

These are checks compatible with the L<Moose> typing system.  They are used to see 
if passed information is compatible with some standard.  For mor information see 
L<Type::Tiny>.
		
=head3 NameSpace

=over

B<Test:> to see if the name_space fits classical package nameing conventions

B<Accepts:> $string =~ /^[A-Za-z:]+$/

=back
		
=head3 SuperClassesList

=over

B<Test:> Checking for an arrayref of classes suitable for inheritance by the built class

B<Accepts:> an array ref of class names

=back
		
=head3 RolesList

=over

B<Test:> Checking for an arrayref of role suitable for adding to the built class

B<Accepts:> an array ref of role names

=back
		
=head3 Attributes

=over

B<Test:> This is a hash ref of attributes to be added to the built class

B<Accepts:> the hash keys will be treated as the attribute names and the values 
will be treated as the attribute settings.  Only HashRefs are accepted as values 
but no testing of the HashRef for suitability as attribute settings is done prior 
to implementation by $meta-E<gt>add_attribute( $value ).

=back
		
=head3 Methods

=over

B<Test:> This is a hash ref of methods to be added to the built class

B<Accepts:> the hash keys will be treated as the method names and the values 
will be treated as method refs.  Only CodeRefs are accepted as values 
but no testing of the CodeRefs for suitability as methods is done prior 
to implementation by $meta-E<gt>add_method( $value ).

=back
		
=head3 BuildClassDict

=over

B<Test:> This is a Dictionary ref defining the possible entrys to the 
'build_class' function

B<Accepts:>

	Dict[
		package => Optional[ NameSpace ],
		superclasses => Optional[ SuperClassesList ],
		roles => Optional[ RolesList ],
		add_roles_in_sequence => Optional[ RolesList ],
		add_attributes => Optional[ Attributes ],
		add_methods => Optional[ Methods ],
	]

=back

=head1 SUPPORT

=over

L<MooseX-ShortCut-BuildInstance/issues|https://github.com/jandrew/MooseX-ShortCut-BuildInstance/issues>

=back

=head1 TODO

=over

B<1.> Nothing L<currently|/SUPPORT>

=back

=head1 AUTHOR

=over

=item Jed Lund

=item jandrew@cpan.org

=back

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

This software is copyrighted (c) 2014 by Jed Lund

=head1 DEPENDENCIES

=over

L<version>

L<Type::Tiny>

=back

=cut

#########1#########2 main pod documentation end  5#########6#########7#########8#########9