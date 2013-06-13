use Test::More tests => 3;

package MyMoo;
use Moo;
has cow => ( is => 'rw' );
with 'Role::Singleton::New';

package main;

diag("Testing Role::Singleton::New $Role::Singleton::New::VERSION");

is( MyMoo->new(), MyMoo->new(), 'new() gives a the same object each time' );

my $s = MyMoo->new( 'cow' => 42 );

is( $s, MyMoo->new(), 'new() subsequently returns same object (regardless of args)' );

is( $s, MyMoo->new(), 'new() still gives a new object even after there is a singleton in the class' );
