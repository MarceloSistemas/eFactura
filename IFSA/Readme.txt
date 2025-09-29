Subject: Creación certificado Factura Electronica Interieur

Instalar Microsoft Visual C++ 2008 Redistributable Package (x86)  vcredist_x86.exe
Instalar Win32OpenSSL_Light-1_0_0a.exe

------------Nuevo-----------------
1-openssl genrsa -out privadaIFSA2017 2048

2-openssl req -new -key privadaIFSA2017 -subj "/C=AR/O=Interieur Forma/CN=Sistemas/serialNumber=CUIT 30529923461" -out pedidoIFSA2017

3- Subir a la afip pedidoIFSA2017 y obtener el nuevo CRT (lo renombre a Adrian2017.crt)

4- openssl pkcs12 -export -inkey privadaIFSA2017 -in Adrian2017.crt -out certificadoifsa2017.p12

5- renombrar certificadoifsa2017.p12 a ifsa2017.pfx

En la próxima renovación deberías solo comenzar en el paso 3 dado que el 1 y 2 se hizo de nuevo por cambio de 1024 a 2048





------------viejo-----------
Abrir CMD

cd C:\OpenSSL-Win32\bin

openssl genrsa -out privadaIFSA 1024

openssl req -new -key privadaIFSA -subj "/C=AR/O=Interieur Forma/CN=Sistemas/serialNumber=CUIT 30529923461" -out pedidoIFSA

Mandé el archivo pedidoIFSA por mail a la afip

Recibí de la afip el mail, copie el contenido del certificado en certificadoIFSA_test.crt
Lo copie en C:\OpenSSL-Win32\bin

Ejecuté
C:\OpenSSL-Win32\bin>openssl pkcs12 -export -inkey privadaIFSA -in certificadoifsa_test.crt -out certificadoifsa_test.p12
Me pidió Password y le puse Marcelo

Di doble click en certificadoifsa_test.p12 puse la password, chequee Mark this key as exportable, next, finish

Abri el IExplore tools, internet options, contents, certificates, seleccioné el certificado
Botón Exportar, seleccione Yes, export the private key, luego tilde enable strong protection

