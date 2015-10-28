# Tableau-Authorize.Net
This is very small sample Tableau 9.1 web data connector to Authorize.Net just to show the capability how to load data from Authorize.Net directly to Tableau.

[![Tableau and Authorize.Net Web Data Connector](http://i.imgur.com/XBd13lW.png)](https://vimeo.com/143787905 "Tableau and Authorize.Net Web Data Connector - Click to Watch")


- I use *getUnsettledTransactionListRequest* call (just to illustrate the capability). Please see Authorize.Net documentation for more details http://developer.authorize.net/api/reference/index.html#transaction-reporting-get-unsettled-transaction-list

- in theory, the incremental refresh should work as well

- the way I handle keys is really not the way it should be done for production purposes. While convinient, it saves the keys with the actual report (persists the keys), not to mention it persists the keys in the Tableau bookmarks

- I use JSON calls, while still in beta I feel we should not go back to XML ever again for cases like this ;-)

- CSS comes from Saran Chamling and his really nice samples http://www.sanwebe.com/2014/08/css-html-forms-designs 


thank you [Brian](https://github.com/brianmc) for not killing me for my constant bitching about API standards


#How to run it

- get your Authorize.Net Sandbox Login ID and Transaction Key
- by default Transaction API is disabled, you have to login to Authorize.Net console and enable it

- simply clone this repo
- start simple web server e.g. python ```python -m SimpleHTTPServer 8888``` or ruby ```ruby -run -e httpd . -p 8888``` in the same directory 

- open Tableau, select "Web Data Connector" as a datasource
- paste this link http://localhost:8888/AuthorizeNet.html
- use the Login ID and Transaction Key generated by Authorize.Net


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




