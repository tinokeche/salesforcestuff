public class SouthAfricanIdService 
{
    public List<South_African_ID__c> setSearchCount(List<South_African_ID__c> southAfricanIds)
    {
        if(!southAfricanIds.isEmpty())
        {
            for (South_African_ID__c southAfricanId : southAfricanIds) 
            {
                setSearchCount(southAfricanId);
            }
        }

        return southAfricanIds;
    }

    public South_African_ID__c setSearchCount(South_African_ID__c southAfricanId)
    {
        if(southAfricanId == null)
            return null;

        southAfricanId.Search_Count__c = southAfricanId.Search_Count__c == null ? 1 : southAfricanId.Search_Count__c + 1;

        return southAfricanId;
    }
}