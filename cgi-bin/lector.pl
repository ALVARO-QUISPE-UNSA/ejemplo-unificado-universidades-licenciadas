#!/usr/bin/perl
use strict;
use warnings;
open(IN, "../src/Programas-de-universidades.csv") or die "File not found\n";
my @file = <IN>;

close(IN);
sub encabezado {
  my $line = $_[0];
  my $c = 1;
  while ($line =~ /^([^\|]+)\|(.+)/) {
    print "$c): $1\n";
    $line = $2;
    $c++;
  }
  print "$c): $line\n";
}
sub getPattern {
  my $first = "";
  for (my $i = 0; $i < $_[0] - 1; $i++) {
    $first .= "(.*?)\\|";
  }
  $first .= "([^\|]+)";
  return $first;
}
#MAIN-----
encabezado($file[0]);
encabezado($file[1]);
my $pattern = getPattern(23);
my %dict;
foreach my $line (@file) {
  if ($line =~ /$pattern/) {
    my $u = $2;
    my $p = $17;
    if ($11 =~ /arequipa/i) {
      if (!$dict{$u}) { $dict{$u} = 0 };
      $dict{$u} += 1;
      #print "$u:$p\n";
      #print "$line\n";
    }
  }
}
foreach my $i (keys %dict) {
  #print "$i\t$dict{$i}\n"
}
=pod 
te quedaste en el video después del nombrado
en el minuto 9
=cut
