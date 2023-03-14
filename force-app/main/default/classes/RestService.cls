public virtual class RestService 
{
    protected virtual String setRequestQuery()
    {
        return '';
    }
 
    protected virtual String setRequestMethod()
    {
        return '';
    }
    
    protected virtual String setRequestPath()
    {
        return '';
    }
 
    protected virtual String setRequestBody()
    {
        return '';
    }
 
    protected virtual Map<String,String> setRequestHeaders()
    {
        return new Map<String,String>();
    }
 
    protected virtual String setNamedCredential()
    {
        return '';
    }
 
    protected virtual String setRequestEndpoint()
    {
        return 'callout:' + setNamedCredential() + setRequestPath() + setRequestQuery();
    }
 
    public HttpResponse makeCallout()
    {
        HttpRequest request = new HttpRequest();
        request.setMethod(setRequestMethod());
        Map<String, String> requestHeaders = setRequestHeaders();
        for (String header : requestHeaders.keySet()) 
        {
            request.setHeader(header, requestHeaders.get(header));
        }
        if (String.isNotBlank(setRequestBody()) && (setRequestMethod() == HttpProperties.HTTP_VERB_POST || setRequestMethod() == HttpProperties.HTTP_VERB_PUT || setRequestMethod() == HttpProperties.HTTP_VERB_PATCH)) 
        {
            request.setBody(setRequestBody());
        }
        request.setEndpoint(setRequestEndpoint());
        Http http = new Http();  
        HttpResponse response = http.send(request);
        return response;
    }

    public class Response 
    {
        public List<Holidays> holidays {get;set;} 
    }

    public class Holidays
    {

    }
 }