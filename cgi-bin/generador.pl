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
if (defined($q->param("licent"))) {$idx{6} = $q->param("licent"); }
if (defined($q->param("department"))) {$idx{11} = $q->param("department"); }
if (defined($q->param("programName"))) {$idx{17} = $q->param("programName"); }
sub matcher {
  foreach my $line (@_) {
    my @params = split(/\|+/, $line);
    foreach my $i (keys %idx) {
      print "$params[1], $idx{2}\n";
      if ($params[$i - 1] =~ /$idx{$i}/i) {
        print "yes";
      }
    }
  }
}
matcher($file[2]);
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


