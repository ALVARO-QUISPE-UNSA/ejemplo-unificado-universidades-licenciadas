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
if (defined($q->param("licent"))) {$idx{2} = $q->param("licent"); }
if (defined($q->param("department"))) {$idx{2} = $q->param("department"); }
if (defined($q->param("programName"))) {$idx{2} = $q->param("programName"); }
foreach my $v (keys %idx) {
  print "$idx{$v}\n";
}
sub matcher {
  my $name = $q->param("name");
  my $licent = $q->param("licent");
  my $department = $q->param("department");
  my $programName = $q->param("programName");
  
  
}
sub printTable {

}



