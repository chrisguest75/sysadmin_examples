##############################################################
## Endpoint test
##############################################################
GET http://0.0.0.0:8080
X-Session-ID: abc123

HTTP 200
[Captures]
hostname1: jsonpath "$.hostname"
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"


##############################################################
## Request with the same session ID
##############################################################
GET http://0.0.0.0:8080
X-Session-ID: abc123

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.hostname" == "{{ hostname1 }}"

##############################################################
## Request with the same session ID
##############################################################
GET http://0.0.0.0:8080
X-Session-ID: abc123

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.hostname" == "{{ hostname1 }}"

##############################################################
## Request with the same session ID
##############################################################
GET http://0.0.0.0:8080
X-Session-ID: abc123

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.hostname" == "{{ hostname1 }}"

##############################################################
## Request with the different session ID
##############################################################
GET http://0.0.0.0:8080
X-Session-ID: abc129

HTTP 200
[Captures]
hostname2: jsonpath "$.hostname"
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.hostname" != "{{ hostname1 }}"

##############################################################
## Request with the same session ID
##############################################################
GET http://0.0.0.0:8080
X-Session-ID: abc129

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.hostname" == "{{ hostname2 }}"

##############################################################
## Request with the same session ID
##############################################################
GET http://0.0.0.0:8080
X-Session-ID: abc123

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.hostname" == "{{ hostname1 }}"
