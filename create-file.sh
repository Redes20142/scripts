#!/bin/bash

# Author Nachintoch, teshanatsch@gmail.com
# Script que crea un archivo nuevo C para un proyecto
# Version 1.0, agosto 2013

# cómo usar. Llame el script desde la conola y provéale de los siguientes
# parametros en el orden de aparición:
# projectName - Debe ser el nombre de un proyecto existente
# file-name - El nombre del archivo nuevo. No debe existir previamente; evite
# poner la extensión del archivo (a menos que desee algo del tipo my-file.ext.c)
# boolean - true si quiere indicar que es un archivo fuente que debe escribirse
# en projectName/src o es una cabecera que debe escribirse, false si es una
# cabecera y debe escribirse en projectName/include

if [ "$1" = "" ]
then
    echo "You must provide an existing project name, file name and a boolean (in that order) as parameters to the script.";
    echo "The boolean indicates if the file to create is a source c file (true) or a c header file (false)";
    echo "Here is a list with the existing directories (wich should be all projects; their name must match the project name):";
    ls;
    echo "";
    echo "Example: ./create-file.sh my-project my-file true"
    echo "";
    echo "project name is missing";
    exit 1;
fi
if [ "$2" = "" ]
then
    echo "You must provide an existing project name, file name and a boolean (in that order) as parameters to the script";
    echo "The boolean indicates if the file to create is a source c file (true) or a c header file (false)";
    echo "Example: ./create-file.sh my-project my-file true"
    echo "";
    echo "file name is missing";
    exit 1;
fi
if [ "$3" = "true" ] # construye un archivo en src
then
    if [ -d $1/src/$2.c ]
    then
        echo "A file '"$2".c' already exists on "$1"/src/";
        echo "You must provide another file name, move the existing file to another level or delete it";
        exit 1;
    else
        echo "Creating file "$1"/src/"$2".c";
        touch $1/src/$2.c;
        chmod 644 $1/src/$2.c;
        echo "File created";
        echo "Filling prototype text in new file "$1/src/$2".c";
        echo "// TODO add necesary imports and/ot define header if not using proyect library" >> $1/src/$2.c;
        echo ""  >> $1/src/$2.c;
        echo "/*" >> $1/src/$2.c;
        echo " * TODO write a short description of what the heck does this file should build on" >> $1/src/$2.c;
        echo " *" >> $1/src/$2.c;
        echo " * Autor: Manuel Ignacio Castillo López; 3-0801743-8." >> $1/src/$2.c;
        echo " * manuel_castillo_cc@ciencias.unam.mx" >> $1/src/$2.c;
        echo " * Autor: Mijail Gutiérrez Valdéz; 3-423250-3." >> $1/src/$2.c;
        echo " * mij000@ciencias.unam.mx" >> $1/src/$2.c;
        echo " * Version 1, TODO month and year" >> $1/src/$2.c;
        echo " */" >> $1/src/$2.c;
        echo ""  >> $1/src/$2.c;
        echo "/* TODO define and control the execution of the desired program to build */" >> $1/src/$2.c;
        echo "" >> $1/src/$2.c;
        echo $1"/src/"$2".c created succesfully";
        echo "Updating "$1"/Makefile ...";
        echo $2".o :" >> $1/Makefile;
        echo "	\$(CC) \$(CFLAGS) src/"$2".c -o lib/"$2".o" >> $1/Makefile;
        echo "" >> $1/Makefile;
        echo $1"/Makefile updated";
        echo "File created";
        exit 1;
    fi
fi
if [ "$3" = "false" ] # constuye un archivo en lib
then
    if [ -d $1/include/$2.h ]
    then
        echo "A file '"$2".h' already exists on "$1"/include/";
        echo "You must provide another file name, move the existing file to another level or delete it";
        exit 1;
    else
        echo "Creating file "$1"/include/"$2".h";
        touch $1/include/$2.h;
        chmod 644 $1/include/$2.h;
        echo "File created";
        echo "Filling prototype text in new file "$1/include/$2".h";
        echo "// TODO add necesary imports" >> $1/include/$2.h;
        echo ""  >> $1/include/$2.h;
        echo "/*" >> $1/include/$2.h;
        echo " * TODO write a short description of what the heck does this file should build on" >> $1/include/$2.h;
        echo " *" >> $1/include/$2.h;
        echo " * Autor: Manuel Ignacio Castillo López; 3-0801743-8." >> $1/include/$2.h;
        echo " * manuel_castillo_cc@ciencias.unam.mx" >> $1/include/$2.h;
        echo " * Autor: Mijail Gutiérrez Valdéz; 3-423250-3." >> $1/include/$2.h;
        echo " * mij000@ciencias.unam.mx" >> $1/include/$2.h;
        echo " * Version 1, TODO month and year" >> $1/include/$2.h;
        echo " */" >> $1/include/$2.h;
        echo ""  >> $1/include/$2.h;
        echo "/* TODO define functions and datatypes of the desired program to build */" >> $1/include/$2.h;
        echo "" >> $1/include/$2.h;
        echo $1"/include/"$2".h created succesfully";
        echo "File created";
    fi
else # error
    echo "You must provide an existing project name, file name and a boolean (in that order) as parameters to the script";
    echo "The boolean indicates if the file to create is a source c file (true) or a c header file (false)";
    echo "Example: ./create-file.sh my-project my-file true"
    echo "";
    echo "boolean is missing";
    exit 1;
fi

