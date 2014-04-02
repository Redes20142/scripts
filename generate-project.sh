#!/bin/bash

# Author Nachintoch, teshanatsch@gmail.com
# Script que genera los directorios estandar para un proyecto de programación
# Version 1.1, febrero 2014

# copiar el nombre del programa, proyecto; lo que sea y crear la siguiente
# estructura:
# nombre_proyecto
# nombre_proyecto/src
# nombre_proyecto/include
# nombre_proyecto/bin
# nombre_proyecto/Makefile --con prototipo del archivo. Debe compilar, borrar y
# ejecutar el programa.
# nombre_proyecto/README

# captura el primer parámetro de consola. Se toma como el nombre del proyecto
if [ "$1" = "" ]
then
    echo "You must provide a project name as a parameter to the script";
    echo "Example: ./generate-project.sh project-name"
    exit 1;
fi
if [ -d "$1" ]
then
    echo "A directory '"$1"' already exists on this file system level";
    echo "You must provide another project name, move the existing directory to another level or delete it";
    exit 1;
else
    echo "Creating project '"$1"'";
    mkdir $1;
    mkdir $1/src;
    mkdir $1/include;
    mkdir $1/bin;
    mkdir $1/lib;
    touch $1/Makefile;
    touch $1/README.txt;
    touch $1/src/main.c
    chmod 777 $1/Makefile;
    chmod 644 $1/README.txt;
    chmod 644 $1/src/main.c;
    echo "Directories and files created";
    echo "Filling up prototype text in project Makefile";
    #echo "# atuo-generated file by Nachintoch project generator script. Visit http://www.manuelignasch.wordpress.com/ (spanish only) for more programming tools and info" >> $1/Makefile;
    #echo "" >> $1/Makefile;
    echo "# environment variables. Compiler and its flags" >> $1/Makefile;
    echo "# to build a debuggable version call make as: \"make G=-g\"" >> $1/Makefile;
    echo "# this also can be used to pass custom flags to gcc to build the progam" >> $1/Makefile;
    echo "# be aware that the G flags will also be present on executable builds, so be wise when using it." >> $1/Makefile;
    echo "CC = gcc" >> $1/Makefile;
    echo "CFLAGS = -c -Wall -x c -I ./include/ -O2 -ffunction-sections -fdata-sections -funit-at-a-time -std=c99 -D_GNU_SOURCE" >> $1/Makefile;
    echo "" >> $1/Makefile;
    echo "all : build" >> $1/Makefile;
    echo "" >> $1/Makefile;
    echo "build : main.o" >> $1/Makefile;
    echo "	\$(CC) \$(G) lib/main.o -o bin/"$1" # TODO add tags for all necesary libs to make the main" >> $1/Makefile;
    echo "	chmod 774 bin/"$1 >> $1/Makefile;
    echo "" >> $1/Makefile;
    echo "main.o :" >>$1/Makefile;
    echo "	\$(CC) \$(CFLAGS) \$(G) src/main.c -o lib/main.o" >> $1/Makefile;
    echo "# TODO insert makefile tasks" >> $1/Makefile;
    echo "" >> $1/Makefile;
    echo "clean :" >> $1/Makefile;
    echo "	rm -f bin/*" >> $1/Makefile;
    echo "" >> $1/Makefile;
    echo "cleanall :" >> $1/Makefile;
    echo "	rm -f bin/* lib/*" >> $1/Makefile;
    echo "" >> $1/Makefile;
    echo "exec :" >> $1/Makefile;
    echo "	bin/"$1 >> $1/Makefile;
    echo "" >> $1/Makefile;
    echo "Makefile done.";
    echo "Filling up prototype text in project README.txt";
    echo "NOMBRE PRACTICA O TAREA" >> $1/README.txt;
    echo "REDES DE COMPUTADORAS 2014-1" >> $1/README.txt;
    echo "Manuel Ignacio Castillo López; 3-0801743-8" >> $1/README.txt;
    echo "Mijail Gutiérrez Valdéz; 3-423250-3." >> $1/README.txt;
    echo "José Carlos León Pérez" >> $1/README.txt;
    echo "Profr. José Luis Torres Rodríguez" >> $1/README.txt;
    echo "Ayudante de laboratorio: Luis Enrique Serrano Gutiérrez" >> $1/README.txt;
    echo "" >> $1/README.txt;
    echo "MODO DE EJECUCION DEL PROGRAMA" >> $1/README.txt;
    echo "Por medio de la consola de comandos de su preferencia, nos desplazamos hacia el" >> $1/README.txt;
    echo "directorio donde ha guardado el programa; y debemos llegar hasta la carpeta del" >> $1/README.txt;
    echo "mismo:" >> $1/README.txt;
    echo "\$"$1 >> $1/README.txt;
    echo "" >> $1/README.txt;
    echo "Para compilar el código fuente que se proporciona, basta con ingresar el comando" >> $1/README.txt;
    echo "'make':" >> $1/README.txt;
    echo $1"\$ make" >> $1/README.txt;
    echo "" >> $1/README.txt;
    echo "Para ejecutar el programa; ingresamos 'bin/"$1"':" >> $1/README.txt;
    echo $1"\$ bin/"$1 >> $1/README.txt;
    echo "" >> $1/README.txt;
    echo "SOBRE EL DESPLIEGE EN PANTALLA" >> $1/README.txt;
    echo "" >> $1/README.txt;
    echo "" >> $1/README.txt;
    echo "DETALLE DE VERSIONES UTILIZADAS" >> $1/README.txt;
    echo "Núcleo de Linux: 3.2.0-4-686-pae" >> $1/README.txt;
    echo "Compilado con: GNU C Compiler (GCC), versión 4.7.2 (Debian 4.7.2-5)" >> $1/README.txt;
    echo "Plataforma: Debian 7.3 <<Wheezy>> para Intel-x86 (32 bits)" >> $1/README.txt;
    echo "" >> $1/README.txt;
    echo "README.txt done.";
    echo "Filling up prototype text in project/src/main.c";
    echo "// TODO add necesary imports and/ot define header if not using proyect library" >> $1/src/main.c;
    echo "" >> $1/src/main.c;
    echo "/*" >> $1/src/main.c;
    echo " * TODO write a short description of what the heck does this file should build on" >> $1/src/main.c;
    echo " *" >> $1/src/main.c;
    echo " * Autor: Manuel Ignacio Castillo López; 3-0801743-8." >> $1/src/main.c;
    echo " * manuel_castillo_cc@ciencias.unam.mx" >> $1/src/main.c;
    echo " * Autor: Mijail Gutiérrez Valdéz; 3-423250-3." >> $1/src/main.c;
    echo " * mij000@ciencias.unam.mx" >> $1/src/main.c;
    echo " * Autor: José Carlos León Pérez; 3-423250-3." >> $1/src/main.c;
    echo " * carlos.leon@ciencias.unam.mx" >> $1/src/main.c;
    echo " * Version 1, TODO month and year" >> $1/src/main.c;
    echo " */" >> $1/src/main.c;
    echo ""  >> $1/src/main.c;
    echo "/*" >> $1/src/main.c;
    echo " * TODO define and control the execution of the desired program to build" >> $1/src/main.c;
    echo " */" >> $1/src/main.c;
    echo "int main(void)" >> $1/src/main.c;
    echo "{" >> $1/src/main.c;
    echo "	return 0;" >> $1/src/main.c;
    echo "}//main" >> $1/src/main.c;
    echo "" >> $1/src/main.c;
    echo $1"/src/main.c done.";
    echo "Project '"$1"' created.";
fi

