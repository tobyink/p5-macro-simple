=pod

=encoding utf-8

=head1 PURPOSE

Test that Macro::Simple can do weird stuffs.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2022 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

use strict;
use warnings;
use Test::More;

use Macro::Simple {
	'MYLOOP($$$)' => sub {
		my ( $var, $arr, $block ) = @_;
		$block =~ s/^sub//;
		return "for my $var ($arr) $block";
	},
};

my @list = ( 1 .. 5 );
my $sum;

MYLOOP( $x, @list, sub { $sum += $x } );

is $sum, 15;

done_testing;

