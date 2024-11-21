##############################################################
## Endpoint test
##############################################################
GET http://0.0.0.0:8080

HTTP 200
[Captures]
hostname: jsonpath "$.hostname"
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

GET http://0.0.0.0:8080/env

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"

