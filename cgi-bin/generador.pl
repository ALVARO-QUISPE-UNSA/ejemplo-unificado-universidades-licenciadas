#!/usr/bin/perl
use strict;
use warnings;
use CGI;
my $q = new CGI;
print "Content-type: text/html\n\n";
#Open file
open (IN, "../src/Programas-de-universidades.csv") or die "<h1>File not found>/h1>";
my @file = <IN>;
close(IN);
#get the regex
sub getPattern {
  my $first = "";
  for (my $i = 0; $i < $_[0] - 1; $i++) {
    $first .= "(.*?)\\|";
  }
  $first .= "([^\|]+)";
  return $first;
}
#get the defied variables
my %idx;
if (defined($q->param("name"))) {$idx{2} = $q->param("name"); }
if (defined($q->param("licent"))) {$idx{5} = $q->param("licent"); }
if (defined($q->param("department"))) {$idx{11} = $q->param("department"); }
if (defined($q->param("programName"))) {$idx{17} = $q->param("programName"); }
#match and print the lines
sub matcher {
  foreach my $line (@_) {
    chomp($line);
    my @params = split(/\|/, $line);
    my $match = 1;
    foreach my $i (keys %idx) {
      #print "$i, $idx{$i}, $params[$i-1]\n\n";
      if (!( $params[$i - 1] =~ /$idx{$i}/i )) {$match = 0; last;}
    }
    if ($match) { printRow(@params); }
  }
}
matcher(@file);
#print an arras into a row 
sub printRow {
  print "<tr>\n";
  foreach my $data (@_) { print "<td>$data</td>\n"; }
  print "</tr>\n";
}
=pod
vemos las variables válidas,
  - if defines con dict
comprobamos si linea cumple le filtro
  - separar cada campo
imprimimos cada campo en una tabla
  - asignar cada campo 
  - imprimir tabla
=cut


