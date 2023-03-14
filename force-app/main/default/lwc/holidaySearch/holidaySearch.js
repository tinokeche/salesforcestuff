import { LightningElement, track } from 'lwc';
import getHolidays from '@salesforce/apex/HolidaySearchController.getHolidays';

export default class HolidaySearch extends LightningElement {
    @track idNumber = '';
    @track noHolidays = false;
    @track holidays = null;
    @track isError = false;
    @track errorMessage = '';
    @track isSearchDisabled = true;
    @track isLoading = false;

    luhnAlgotithmCheck(idNumber)
    {
        let nSum = 0;
        let isSecond = false;
        

        for (let i = idNumber.length -1; i >= 0; i--)
        {
          let d = idNumber[i].charCodeAt() - '0'.charCodeAt();

          if (isSecond == true)
              d = d * 2;

          nSum += parseInt(d / 10, 10);
          nSum += d % 10;

          isSecond = !isSecond;
        }

        return (nSum % 10 == 0);
    }

    isValidSouthAfricanIdNumber(idNumber) 
    {
      if (!idNumber) 
      {
        return false;
      }
      
      if (!/^\d{13}$/.test(idNumber)) 
      {
        return false;
      }
      const year = parseInt(idNumber.substr(0, 2));
      const month = parseInt(idNumber.substr(2, 2))-1;
      const day = parseInt(idNumber.substr(4, 2));
      const date = new Date(year, month, day);
      if (date.getYear() !== year || date.getMonth() !== month || date.getDate() !== day) 
      {
        return false;
      }

    
    return this.luhnAlgotithmCheck(idNumber);

    }

    handleInputChange(event) 
    {   
      
      try 
      {
        const input = event.target.value;
        this.idNumber = input;
        const isValidIdNumber = this.isValidSouthAfricanIdNumber(input);
        this.isSearchDisabled = !isValidIdNumber;
        this.errorMessage = isValidIdNumber ? null : 'Please enter a valid South Africa ID number.';
      } 
      catch (error) 
      {
        console.log(error.message);
      }
        
    }

    searchForHolidays() 
    { 
      this.isLoading = true;
      getHolidays({idNumber: this.idNumber})
          .then(result => {
            this.isLoading = false;
            this.holidays = result;
            if(this.holidays.length == 0)
              this.noHolidays = true;
            else
              this.noHolidays = false;

              this.isLoading = false;
          })
          .catch(error => {
            console.log(error.message);
            this.isLoading = false;
          });
  }
  
}