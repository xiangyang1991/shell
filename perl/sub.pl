#!/bin/prel
sub max {
	my($wath,@array) = @_;
	foreach my $x (0..$#array) {
		my $line = $array[$x];
		if ($line eq $wath) {
			return $x;
		} else {
			-1
		}
	}
}
$lines = "yyyy";
@name = qw (jijief ieoi jieeeoiifg yyyy);
$return = max($line, @name);
print $return;