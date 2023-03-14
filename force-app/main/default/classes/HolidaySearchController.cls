public without sharing class HolidaySearchController 
{
    @AuraEnabled
    public static List<CalendarificDTO.Holidays> getHolidays(String idNumber) 
    {
        try
        {
            SouthAfricanIDDTO dto = SouthAfricanIDDTO.parseIdNumber(idNumber);
            CalendarificService service = new CalendarificService(dto.year);
            HttpResponse response = service.makeCallout();
            CalendarificDTO result = CalendarificDTO.parse(response.getBody());
            
            List<South_African_ID__c> southAfricanIds = SouthAfricanIDQueries.getByIdNumber(new List<String>{idNumber});
            if(!southAfricanIds.isEmpty())
            {
                update new SouthAfricanIdService().setSearchCount(southAfricanIds);
            }
            else 
            {
                insert new SouthAfricanIdService().setSearchCount(SouthAfricanIdMapper.toSObject(dto));
            }
    
            return result.response.holidays;
        }
        catch(Exception e)
        {
            System.debug('Exception:::' + e.getStackTraceString());
        }

        return null;
    }
}