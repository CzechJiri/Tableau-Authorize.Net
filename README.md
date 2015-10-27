# Tableau-Authorize.net
This is very small sample Tableau 9.1 web data connector to Authorize.Net just to show the capability how to load data from Authorize.Net directly to Tableau.

[![Tableau with Web Connector to Authorize.Net](http://i.imgur.com/7YTMFQp.png)](https://vimeo.com/143784699 "Tableau with Web Connector to Authorize.Net)

- I use getUnsettledTransactionListRequest call (just to illustrate the capability). Please see Authorize.Net documentation for more details http://developer.authorize.net/api/reference/index.html#transaction-reporting-get-unsettled-transaction-list

- in theory, the incremental refresh should work as well

- the way I handle keys is really not the way it should be done for production purposes. While convinient, it safes the access keys with the report

- I use JSON calls, while still in beta I feel we should not go back to XML ever again for cases like this ;-)

- CSS comes from Saran Chamling and his really nice samples http://www.sanwebe.com/2014/08/css-html-forms-designs 


thank you @brianmc for not killing me for my constant bitching about API standards


#How to run it

- get your Sandbox access to Authorize.Net DA!
- simply clone the repo
- start the web server e.g. ```ython -m SimpleHTTPServer 8888``` in the same directory 
- open Tableau, select "Web Data Connector" as a datasource and paste this lin khttp://localhost:8888/AuthorizeNet.html


#cURL calls

in case anybody wants to play with cURL and is wondering with Authorize.Net docs lack of simple cURL samples, here it is

```
curl -H "Content-Type: application/json" -X POST -d '
{
    "getUnsettledTransactionListRequest": {
        "merchantAuthentication": {
            "name": "YOUR_API_ID",
            "transactionKey": "TRANSACTION_KEY"
        }
    }
}
' https://apitest.authorize.net/xml/v1/request.api
```




