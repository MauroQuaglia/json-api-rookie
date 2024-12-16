Esempi di URL in formato JSON:API valido:

/api/v1/vendors/1 -> dammi il vendor con ID = 1

/api/v1/vendors/1/relationships/coupons

/api/v1/vendors/1/coupons

/api/v1/vendors?
page[number]=1&
page[size]=10&
sort=-rank,-name&
fields[vendors]=name,rank
filter[url_name]=amazon,ebay
include=merchant