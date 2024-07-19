1. Le materiel A est un switch qui permet une communication direct sur tous ses port   

2. Il s'agit d'un routeur qui perment la connexion entre différents réseaux ou sous-réseaux IP.  
 il permet une connexion avec le reseau `10.12.2.0/24`

3. Il s'agit des interface du routeur f0/0 pour fastethernet et g1/0 pour giga .

4. c'est le cdir du reseau 10.11.0.0

5. c'est l'adresse de braocast 

6. 
pc1 : 
- 10.10.0.0 
 - 10.10.0.1 
 - 10.10.255.254
 - 10.10.255.255
 
 pc2 :
 - 10.11.0.0
 - 10.11.0.1
 - 10.11.255.254
 -10.11.255.255

 pc5 :
 - 10.10.0.0
 - 10.10.0.1
 - 10.11.255.254
 - 10.11.255.255

 7.  tous les pc sauf le pc2 peuvent communiquer

 8. tous sauf le pc2 
 9. rien
 10. il faut un serveur DHCP pour attribuer les adresse.

 ## analyse des trames fichier 1

 1. 00:50:79:66:68:00

 2. oui car nous avons un echo reply et un echo request

 3. request :  c'est le pc 1   
                00:50:79:66:68:00  
                10.10.4.1/16  
    reply : c'est le pc 4  
            00:50:79:66:68:03  
            10.10.4.2/16  

 4. il s'agit du protocole arp qui permet de faire correspondre une adresse IP (Internet Protocol) à une adresse MAC (Media Access Control) sur un réseau local.

 5. A a permit la connexion entre les deux pc et B n'est pas intervenue

 ## analyse des trames fichier 2

 1. c'est le pc 3 qui initialise de connexion a partir de l'ip 10.10.80.3  

 2. c'est le protocole ICMP il est utilisé par les périphériques réseau pour signaler des erreurs de transmission de données et d'autres informations.

 3.  non la communication a échouer

 4. il ne trouve pas l'ip demander car elle n'est pas dans le même reseaux 

 5. aucun

 ## analyse des trames fichier 3

1. ipsource 10.10.4.2  
    ip destination 172.16.5.253

2. address mac source ca:01:da:d2:00  
   adresse mac destination ca:03:9e:ef:00:38
    

3. l'enregistrement a eu lieu entre les deux routeur

