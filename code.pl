#!/usr/local/perl

print "Ingresa la url al que deseas modificar los src y href> ";
$url=<>;
chomp $url;
print "ingresa las url que queres agregar, ejemplo> http://origininal.com >> ";
$prefijo = <>;
chomp $prefijo;
print $prefijo;
print "Descargando ".$url;
system("wget \"$url\" -O 'modificar.html'");
$archivo = "modificar.html";
print "Desea modificar parametros SRC ? si o no>";
$opcionSrc=<STDIN>;
chomp $opcionSrc;
if($opcionSrc=="si"){
	##se mantiene el valor
}else{
	$opcionSrc="no";
}
print "Desea modificar parametros HREF ? si o no>";
my $opcionHref=<>;
chomp $opcionHref;
if($opcionHref=="si"){
	##se mantiene el valor
}else{
	$opcionHref="no";
}

open $datos, '<', $archivo or die "No se pudo abrir el archivo, Seguro existe?";
		local $/;
		my $html = <$datos>;
close $datos;

if($opcionSrc eq "si"){
	if($html =~ s{src="}{src="$prefijo/}g){    # ¡zas!
		print "Se remplazo los src";
	}else{
		print "Hubo un problema al remplazar los src";
	}
}

if($opcionHref eq "si"){
	if($html =~ s{href="}{href="$prefijo/}g){    # ¡zas!
		print "Se remplazo los href";
	}else{
		print "Hubo un problema al remplazar los href";
	}
}

open $manejador, '>',$archivo or die "No se puede escribir en el fichero $url";
	print $manejador $html;
close $manejador;
