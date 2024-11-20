Page Query Parameter Family: page[a], page[b], page[c]
base_name: page
parameters: a, b ,c

Filter Query Parameter Family: filter, filter[], filter[x], filter[x][], filter[x][y],filter[x.y], filter[x][y][t.z], ...
base_name: filter
parameters: ... 

# Attenzioni e Regole generali

* https://jsonapi.org/format/#query-parameters-custom
* Definire nuovi parametri
* Se definisco un Query Parameter nuovo, per rispettare la specifica deve contenere almeno un carattere che non sia [a-z]
* GET /coupons?vendor[status]=active va bene perché c'è un base name
* GET /coupons?vendor=active non va bene perché vendor ha solo caratteri [a-z]



https://jsonapi.org/format/#fetching
Client dirà -> Accept: application/vnd.api+json
Server dirà -> Content-Type: application/vnd.api+json

Quando faccio il fetch di una collezione rispondo sempre con un array.
GET /articles
Response: "data": [], "data": [{a}], "data": [{a},{b},{c}]
Se voglio posso includere le relationship

Quando faccio il fetch di una singola risorsa rispondo con null o la risorsa.
GET /articles/1
Response: "data": null, "data": {a}
Se voglio posso includere le relationship
Posso decidere se "data": null con status 200 
oppure errore con status 404 (eventualmente aggiungendo dettagli, ma non è obbligatorio)
