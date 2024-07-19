# Exercice 1 : Modification IP client serveur
   ### Q.1.1 Sans changer les adresses IPv4 des 2 machines, montre et explique le résultat d'un ping IPv4 du serveur vers le client.  

Dans un premier temps aprés la connexion j"ai fait sur chaque machine un `ipconfig /all` afin de connaitre leur adresse IP respective.

J'ai fait un Ping du serveur (172.16.10.10/24) vers le client (170.16.100.50/24) et celui çi me retourne une erreur car les deux machine ne sont pas dans le même reseaux .

![ip diff]()

> Adresse IPv4 serveur 172.16.10.10    
Masque de réseau : 255.255.255.0  
Adresse de réseau : 172.16.10.0  
Première adresse : 172.16.10.1  
Dernière adresse : 172.16.10.254

> Adresse IPv4 172.16.100.5  
Masque de réseau : 255.255.255.0  
Adresse de réseau : 172.16.100.0  
Première adresse : 172.16.100.1  
Dernière adresse : 172.16.100.254

Pour que le ping fonctionne il faut mettre le client sur le même reseaux que le serveur.  
Pour ça j'utilise l'application `exécuter` ou en cherchant dans la barre de recherche ou en utilisant la combinaison ![w+r]() puis la comande `ncpa.cpl` qui m'ouvre directement la fenétre de la carte réseaux.  
![carte]()  
 je me rend dans les propritétées de la carte réseaux .  
 ![propriétées]()   
Dans le cadre **général** je modifie l'adresse IP pour une dans le même réseaux que le serveur (172.16.10.50/24), et je coche la case `Valider les paramètres en quittant`
 
Mainteant mon client a bien l'adresse IP `172.16.10.50` et le ping fonctionne .
![ping ok]() 

 ### Q.1.2 Montre et explique le résultat d'un ping du serveur vers le client avec le nom des machines.
 En faisant un ping du serveur vers le client avec le nom du client (Client1)   
 ![ping nom]()    

 J'ai un retour par l'adresse IPV6 car le serveur a fait un ping sur l'adresse IPV6 de liaison local .  
 Dans toutes les versions de Windows à partir de Vista, les adresses UPv6 UNCAST sont préférées aux adresses IPv4 (selon le RFC 3484).  
Si le serveur essaie d’accéder à un client  à l’aide d’un protocole ICMP (Commandes Ping), et il renvoie l’adresse IPv6 .  

### Q.1.3 Désactive le protocole IPv6 sur le client.  

En modifiant les parametres de la carte reseaux et en décochant Protocole IPV6 je désactive IPV6 sur le client1    
![stop ipv6]()  

Je refait un ping avec le nom du client et le retour est ok car Les systèmes d'exploitation modernes maintiennent un cache DNS local qui stocke les résolutions de noms précédents. 

### Q.1.4 Change et montre les configurations réseaux sur le client et/ou sur le serveur pour mettre en place le DHCP.
Sur le servuer le rôle DHCP est déja installer , sur le client je retourne dans la configuration de la  carte réseau et choisie `Obtenir une adresse IP automatiquement`  
![changeip]()   
On voit bien le changement d'adresse IP qui est passée de `172.16.10.50` à `172.16.10.20`  

### Q.1.5 Explique pourquoi le client ne récupère pas la 1ère adresse disponible sur cette plage.  

La première adresse d'un réseau IP ne peut pas être attribuée à un appareil car elle est réservée pour identifier le réseau lui-même.   
La première adresse d'un réseau IPv4 est utilisée pour identifier le réseau lui-même.
Cette adresse est réservée et ne peut pas être attribuée.  
 
### Q.1.6 Fais une modification sur le DHCP pour que le client ai l'adresse IP 172.16.10.15.
Pour que le client est une adresse définie nous devons sur le serveur DHCP faire une réservation d'adresse   
![dhcp]()  

je remplis les champs demandés .  
![reserc]()  

Sur le client je restitue mon adresse ip avec `ipconfig / release` puis en redemande une avec `ipconfig /renew`  
![newip]()  
Mon **Client1** à changer d'adresse.  

### Q.1.7 Au vu de tes manipulations, explique l'intérêt de passer ce réseau en IPv6 ?
L'avantage du reseaux IP c'est que l'on peut ce passer d'un serveur DHCP et même d'un DNS car les adresses étant unique on peut s'en passer.  

### Q.1.8 Est-ce que dans ce cas le serveur DHCP est obsolète ?  
Non car pour les entreprise, un adressage volontaire des aderesses ains que le choix de la durée du bail  peut être bénefique pour la gestion du reseaux .

Pour utiliser DHCP en IPV6 il faut crée une nouvelle étendue dans IPv6 .




 


