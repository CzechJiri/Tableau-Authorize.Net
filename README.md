# Tableau-Authorize.net
This is very simple sample Tableau 9.1 connector to Authorize.Net just to show the capability to load data from Authorize.Net directly to Tableau.

- I use getUnsettledTransactionListRequest call (just to illustrate the capability). Please see Authorize.Net documentation for more details http://developer.authorize.net/api/reference/index.html#transaction-reporting-get-unsettled-transaction-list

- in theory, the incremental refresh should work as well

- the way I handle keys is really not the way it should be done for production purposes. While convinient, it safes the access keys with the report

- I use JSON calls, while still in beta I feel we should not go back to XML ever again for cases like this ;-)

- You can run it locally or try it on my GitHub page https://CzechJiri.github.io/Tableau-Authorize.net/AuthorizeNet.html (obviously you need Authorize.Net sandbox access)


thank you Brian McManus for not killing me for my constant bitching about API standards


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




