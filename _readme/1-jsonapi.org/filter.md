filter[r1.value]
filter[r1.r2.value]
filter[r1.r2.r3.value]


The filter query parameter family is reserved to be used as the basis for any filtering strategy:
Quindi ogni filtraggio deve usare filter.

Fanno la stessa cosa ma la prima segue lo standard JSON:API la seconda no.
GET /vendors?filter[name]=amazon (significa filter[vendor.name]=amazon)
GET /vendors?name=amazon


Dot separated lists of legal member names are intended to be used for relationship paths.
For example, this allows filtering strategies using relationship paths: GET /posts?filter[author.status]=active


filter[name] -> significa che si riferisce alla risora principale.
Se non metto niente è come se di default ci fosse la risorsa principale
filter[name] == filter [vendor.name]

filter[author.status] -> significa che si riferisce alla relazione con author