#!/usr/bin/perl
use strict;
use warnings;
my %dict;
$dict{"a"} = "hola";
$dict{a} = "h";
$dict{3} = "h";
$dict{5} = "h";
my $a = "as";
$dict{$a} = 23;
my @arr = (1, 2 ,3, 9);
sub printarray {
  foreach my $elem (@_) {
    print "$elem\n"
  }
}
printarray(@arr);
