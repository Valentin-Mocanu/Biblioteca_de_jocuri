# Biblioteca de Jocuri.ro

Biblioteca de Jocuri.ro este o aplicatie web, creata folosind limbajul PHP si comunicand cu o baza de date MySQL. Aceasta aplicatie web are scopul de a le oferi utilizatorilor un mod simplu, sigur si placut de a gasi o gama larga de jocuri video retro, sub forma unei biblioteci online, care au fost create si iubite pe platformele lor nostalgice, in perioada lor de gratie. 

## Limbaje/Tehnologii folosite:

- Notepad++ - folosind urmatoarele limbaje:
    * PHP - pentru a face aplicatia web dinamica;
    * HTML5 - pentru structurarea continutului;
    * CSS3 - pentru stilizare;
- XAMPP - folosind:
    * Apache - pentru a crea serverul web;
	* MySQL - pentru a crea baza de date folosita la aplicatia web.
	
## Cum sa accesati aplicatia web?

Mai intai trebuie sa ne cream un server web (in cazul nostru va fi local) pentru aplicatia noastra. Deschidem programul XAMPP (sau un alt program compatibil care are acelasi rol si optiuni disponibile) si pornim Apache si MySQL.
Apoi vom accesa acest link folosind un browser web (link-ul: http://localhost/phpmyadmin ), iar in meniul de sub bara de cautare de pe pagina respectiva vom apasa pe "Import", introducem fisierul "retro_games_site.sql" si apasam pe butonul "Import". Facem acest lucru pentru a avea acces la baza de date folosita in aplicatia web.
Dupa trebuie sa introducem fisierul "home.php" si folderul "fisiere_proiect" in urmatoarea locatie: C:\xampp\htdocs (bineinteles, depinde de programul sau modul in care il folositi, poate varia aceasta metoda, alaturi de crearea serverului web).
Intr-un final, in bara de cautare a browserului, vom introduce urmatorul link, care ne va conduce la pagina principala a aplicatiei mele web (link-ul: http://localhost/home.php ).


## Ce am invatat din realizarea acestui proiect?

- Crearea unei aplicatii web functionale folosind PHP pentru logica de server si MySQL pentru gestionarea datelor;
- Crearea si gestionarea unei baze de date folosind instructiuni SQL in consola sau folosind PHPMyAdmin ca instrument web;
- Integrarea interactiunii utilizator-aplicatie, prin formulare, autentificare/inregistrare si afisare dinamica a continutului;
- Intelegerea fluxului client-server si modul in care serverul web (Apache) proceseaza cererile si comunica cu baza de date;
