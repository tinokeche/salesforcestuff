
@IsTest
public class CalendarificDTOTest {
	static testMethod void testParse() {
		String json = '{\"meta\":{\"code\":200},\"response\":{\"holidays\":[{\"name\":\"Freedom Day\",\"description\":\"Freedom Day is a public holiday in South Africa\",\"country\":{\"id\":\"za\",\"name\":\"South Africa\"},\"date\":{\"iso\":\"2023-04-27\",\"datetime\":{\"year\":2023,\"month\":4,\"day\":27}},\"type\":[\"National holiday\"],\"primary_type\":\"Public Holiday\",\"canonical_url\":\"https:\\/\\/calendarific.com\\/holiday\\/south-africa\\/freedom-day\",\"urlid\":\"south-africa\\/freedom-day\",\"locations\":\"All\",\"states\":\"All\"}]}}';
		CalendarificDTO r = CalendarificDTO.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CalendarificDTO.Response objResponse = new CalendarificDTO.Response(System.JSON.createParser(json));
		System.assert(objResponse != null);
		System.assert(objResponse.holidays == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CalendarificDTO.Meta objMeta = new CalendarificDTO.Meta(System.JSON.createParser(json));
		System.assert(objMeta != null);
		System.assert(objMeta.code == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CalendarificDTO.Holidays objHolidays = new CalendarificDTO.Holidays(System.JSON.createParser(json));
		System.assert(objHolidays != null);
		System.assert(objHolidays.name == null);
		System.assert(objHolidays.description == null);
		System.assert(objHolidays.country == null);
		System.assert(objHolidays.date_Z == null);
		System.assert(objHolidays.type == null);
		System.assert(objHolidays.primary_type == null);
		System.assert(objHolidays.canonical_url == null);
		System.assert(objHolidays.urlid == null);
		System.assert(objHolidays.locations == null);
		System.assert(objHolidays.states == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CalendarificDTO objCalendarificDTO = new CalendarificDTO(System.JSON.createParser(json));
		System.assert(objCalendarificDTO != null);
		System.assert(objCalendarificDTO.meta == null);
		System.assert(objCalendarificDTO.response == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CalendarificDTO.Country objCountry = new CalendarificDTO.Country(System.JSON.createParser(json));
		System.assert(objCountry != null);
		System.assert(objCountry.id == null);
		System.assert(objCountry.name == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CalendarificDTO.Datetime_Z objDatetime_Z = new CalendarificDTO.Datetime_Z(System.JSON.createParser(json));
		System.assert(objDatetime_Z != null);
		System.assert(objDatetime_Z.year == null);
		System.assert(objDatetime_Z.month == null);
		System.assert(objDatetime_Z.day == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CalendarificDTO.Date_Z objDate_Z = new CalendarificDTO.Date_Z(System.JSON.createParser(json));
		System.assert(objDate_Z != null);
		System.assert(objDate_Z.iso == null);
		System.assert(objDate_Z.datetime_Z == null);
	}
}