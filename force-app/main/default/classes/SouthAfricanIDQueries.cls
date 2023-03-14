public class SouthAfricanIDQueries
{
    public static List<South_African_ID__c> getByIdNumber(List<String> idNumbers)
    {
        return 
        [
            SELECT
                Id,
                Citizenship__c,
                Date_of_Birth__c,
                Gender__c,
                ID_Number__c,
                Search_Count__c
            FROM
                South_African_ID__c
            WHERE
                ID_Number__c IN: idNumbers

        ];
    }
}