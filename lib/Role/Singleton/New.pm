package Role::Singleton::New;

## no critic (RequireUseStrict) - Role::Tiny does strict
use Role::Tiny;

$Role::Singleton::New::VERSION = '0.1';

around 'new' => sub {
    my ( $orig, $self, @args ) = @_;
    my $class = ref($self) || $self;

    no strict 'refs';    ## no critic
    return ${ $class . '::_singleton' } ||= $orig->( $self, @args );
};

1;

__END__

=encoding utf-8

=head1 NAME

Role::Singleton::New - Turn your new() into a singleton constructor

=head1 VERSION

This document describes Role::Singleton::New version 0.1

=head1 SYNOPSIS

Object:

    package ZeroCool

    ## no critic (RequireUseStrict) - Moo does strict
    use Moo;

    with 'Role::Singleton::New;

    …

Code:

    use ZeroCool;

    my $z3r0 = ZeroCool->new(…); # returns a singleton (see Role::Singleton if you want to keep new() as-is and add singleton support)

=head1 DESCRIPTION

See L<Role::Singleton> for more information on singletons.

=head1 INTERFACE 

This role turns new() into a singleton constructor.

=head1 DIAGNOSTICS

Throws no warnings or errors of its own.

=head1 CONFIGURATION AND ENVIRONMENT

Role::Singleton::New requires no configuration files or environment variables.

=head1 DEPENDENCIES

L<Role::Tiny>

=head1 SEE ALSO

L<Role::Multiton::New>, L<Role::Multiton>, L<Role::Singleton>

=head1 INCOMPATIBILITIES

None reported.

See L<Role::Multiton/INCOMPATIBILITIES> for info about object system specific compatibility.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-role-multiton@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 AUTHOR

Daniel Muey  C<< <http://drmuey.com/cpan_contact.pl> >>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2013, Daniel Muey C<< <http://drmuey.com/cpan_contact.pl> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
