#!/usr/bin/perl
use strict;
use warnings;
open(IN, "../src/Programas-de-universidades.csv");
my $line = <IN>;

my $c = 1;
while ($line =~ /^([^\|]+)\|(.+)/) {
  print "$c): ".$1."\n";
  $line = $2;
  $c++;
}
close(IN);
print "$c): $line\n";
