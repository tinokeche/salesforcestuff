public class CalendarificService extends RestService
{
    private Integer year;
    private Callout_Setting__mdt setting;
    
    public CalendarificService(Integer year) 
    {
        this.year = year;
        this.setting = Callout_Setting__mdt.getInstance('Calendarific');
    }

    protected override string setRequestMethod()
    {
        return HttpProperties.HTTP_VERB_GET;
    }

    protected override string setRequestPath()
    {
        return setting.Path__c;
    }

    protected override string setRequestQuery()
    {
        return '&' + 'api_key=' + this.setting.Key__c + '&' + 'country=za' + '&' + 'year=' + this.year;
    }
    
    protected override string setRequestEndpoint()
    {
        return setRequestPath() + setRequestQuery();
    }
}