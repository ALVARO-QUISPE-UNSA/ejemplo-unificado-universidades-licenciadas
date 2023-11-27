#!/usr/bin/perl
use strict;
use warnings;
open(IN, "../Programas de Universidades.csv");
while (my $line = <IN>) {
  print $line;
}
close(IN);
