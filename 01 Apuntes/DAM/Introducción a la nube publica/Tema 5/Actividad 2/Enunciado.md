---
dg-publish: false
---
Vas a implementar una API REST amb una funció GET, a la que li passarem uns paràmetres per URL i activa una funció LAMBDA.

Ací pots posar-te creatiu/creativa, pero la funcionalitat mínima que volem és passar-li un paràmetre, que faça algún tipus de calcul/operació i ens torne un resultat. Com a sugeriment podries fer una API a la que mitjançant paràmetres de la URL se li passa un número, el servidor et calcula el factorial d'eixe número i et torna el resultat. Per example, seria algo semblant a esto:

- Cridem a la API des d'un navegador: " https://url_de_la_API/prod?numero=4 "
- S'activa la funció lambda passant-li el número 4 com a paràmetre i calcula el factorial (4! = 4*3*2*1 = 24 )
- La API ens torna el número 24.

Com s'ha comentat, esto és una sugerència, pero pots exercitar la teua creativitat, sempre que se li passe algún paràmetre a la API i ens torne una informació

