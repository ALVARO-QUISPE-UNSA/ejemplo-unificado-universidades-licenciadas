#!/usr/bin/perl
use strict;
use warnings;
use Encode;
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
  my $results = "";
  foreach my $line (@_) {
    chomp($line);
    my @params = split(/\|/, $line);
    my $match = 1;
    foreach my $i (keys %idx) {
      #print "$i, $idx{$i}, $params[$i-1]\n\n";
      if (!( $params[$i - 1] =~ /$idx{$i}/i )) {$match = 0; last;}
    }
    if ($match) { $results .= makeRow(@params); }
  }
  return $results;
}
#convert an array into a row 
sub makeRow {
  my $row = "<tr>\n";
  foreach my $data (@_) { $row .= "<td>$data</td>\n"; }
  $row .= "</tr>\n";
  return $row;
}

#MAIN-----------------
my $rows = matcher(@file);
$rows = encode('utf-8', $rows);
print<<Ojosazules;
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Consulta-de-universidades-licenciadas.html</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css">

  </head>

  <body>
    <!--Menú de arriva -->
    <ul class="menuList" >
      <li class="dlist"><a class="itemList" href="http://192.168.0.17/~alumno/">Menú</a></li>
      <li ><img src="../src/logoUnsa.png"></li>
    </ul>
    <br>
    <br>
    <br>
    <!--Parte el título -->
    <h1>Realice su consulta</h1>

    <form class="formConsultas" method="get" action="./cgi-bin/generador.pl">
      <table class="filtros">
        <tr>
          <th>Nombre de universidad</th>
          <td><input type="text" name="name"></td>
          <th>Periodo de licenciamiento</th>
          <td><input type="number" name="licent"></td>
        </tr>
        <tr>
          <th>Departamento local</th>
          <td><input type="text" name="department"></td>
          <th>Denominación de programa</th>
          <td><input type="text" name="programName"></td>
        </tr>
      </table>
      <input type="submit" value="BUSCAR">
    </form>
    <br>
    <!--Parte de los resultados-->

    <table class="resultados">
      <tr>
        <th>CODIGO ENTIDAD</th>
        <th>NOMBRE</th>
        <th>TIPO GESTION</th>
        <th>ESTADO LICENCIAMIENTO</th>
        <th>PERIODO LICENCIAMIENTO</th>
        <th>CODIGO FILIAL</th>
        <th>NOMBRE FILIAL</th>
        <th>DEPARTAMENTO FILIAL</th>
        <th>PROVINCIA FILIAL</th>
        <th>CODIGO LOCAL</th>
        <th>DEPARTAMENTO LOCAL</th>
        <th>PROVINCIA LOCAL</th>
        <th>DISTRITO LOCAL</th>
        <th>LATITUD UBICACION</th>
        <th>LONGITUD UBICACION</th>
        <th>TIPO AUTORIZACION LOCAL</th>
        <th>DENOMINACION PROGRAMA</th>
        <th>TIPO NIVEL ACADEMICO</th>
        <th>NIVEL ACADEMICO</th>
        <th>CODIGO CLASE PROGRAMA N2</th>
        <th>NOMBRE CLASE PROGRAMA N2</th>
        <th>TIPO AUTORIZACION PROGRAMA</th>
        <th>TIPO AUTORIZACION PROGRAMA LOCAL</th>
      </tr>
      <tr>
Ojosazules
print $rows;
print<<Ojosazules;
      </tr>
    </table>

  </body>
</html>

Ojosazules
