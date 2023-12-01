#!/usr/bin/perl
use strict;
use warnings;
use CGI;
my $q = new CGI;
print "Content-type: text/html\n\n";
print<<PEACHES;
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Consulta-de-universidades-licenciadas.html</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/style.css">

  </head>

  <body>
    <!--Menú de arriva -->
    <ul class="menuList" >
      <li class="dlist"><a class="itemList" href="http://192.168.0.17/~alumno/">Menú</a></li>
      <li ><img src="src/logoUnsa.png"></li>
    </ul>
    <br>
    <br>
    <br>
    <!--Parte el título -->
    <h1>Realice su consulta</h1>

    <form class="formConsultas">
      <table class="filtros"> 
        <tr>
          <th>Nombre de universidad</th>
          <td>dato</td>
          <th>Periodo de licenciamiento</th>
          <td>dato</td>
        </tr>
        <tr>
          <th>Departamento local</th>
          <td>dato</td>
          <th>Denominación de programa</th>
          <td>dato</td>
        </tr>
      </table>
    </form>
    <br>
    <!--Parte de los resultados-->

    <table class="resultados">
      <tr>
        <th>ssssssssssssssssssssssssssssssssssssssssss123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
        <th>123456789</th>
      </tr>
      <tr>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>
        <td>1</td>

      </tr>
    </table>

  </body>
</html>
PEACHES
