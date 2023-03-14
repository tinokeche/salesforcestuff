public class SouthAfricanIdMapper 
{
    public static South_African_ID__c toSObject(SouthAfricanIDDTO dto)
    {
        if (dto == null)
            return null;
        
        South_African_ID__c saId = new South_African_ID__c();
        saId.ID_Number__c = dto.idNumber == null ? null : dto.idNumber;
        saId.Citizenship__c = dto.citizenship == null ? null : dto.citizenship;
        saId.Date_of_Birth__c = dto.dateOfBirth == null ? null : dto.dateOfBirth;
        saId.Gender__c = dto.gender == null ? null : dto.gender;
        
        return saId;
    }
}