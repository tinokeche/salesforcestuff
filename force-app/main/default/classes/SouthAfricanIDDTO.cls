public class SouthAfricanIDDTO 
{
    public String citizenship;
    public Integer month;
    public Integer day;
    public Integer year;
    public Date dateOfBirth;
    public String gender;
    public String idNumber;

    public static SouthAfricanIDDTO parseIdNumber(String idNumber) 
    {
        SouthAfricanIDDTO dto = new SouthAfricanIDDTO();
        try
        {
            dto.year = Integer.valueOf(idNumber.substring(0, 2));
            dto.month = Integer.valueOf(idNumber.substring(2, 4));
            dto.day = Integer.valueOf(idNumber.substring(4, 6));

            if (dto.year < 23) 
            {
                dto.year += 2000;
            } 
            else 
            {
                dto.year += 1900;
            }

            dto.dateOfBirth = Date.newInstance(dto.year, dto.month, dto.day);
            dto.gender = Integer.valueOf(idNumber.substring(6, 10)) > 4999 ? 'Male' : ' Female';
            dto.citizenship = Integer.valueOf(idNumber.substring(10, 11)) == 0 ? 'SA Citizen' : 'Permanent Resident';
            dto.idNumber = idNumber;
        }
        catch(Exception e)
        {
            System.debug(e.getStackTraceString());
        }

        return dto;
    }
}
