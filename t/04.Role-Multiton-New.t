use Test::More tests => 4;

package MyMoo;
use Moo;
has cow => ( is => 'rw' );
with 'Role::Multiton::New';

package main;

diag("Testing Role::Multiton::New $Role::Multiton::New::VERSION");

my $no = MyMoo->new();
is( $no, MyMoo->new(), 'new() w/ no args returns same object' );

my $m1 = MyMoo->new( 'cow' => 42 );
is( $m1, MyMoo->new( 'cow' => 42 ), 'new() w/ same args returns same object (args no in hashref)' );
is( $m1, MyMoo->new( { 'cow' => 42 } ), 'new() w/ same args returns same object (args in hashref)' );

isnt( $m1, $no, 'new() w/ different args give different object' );
