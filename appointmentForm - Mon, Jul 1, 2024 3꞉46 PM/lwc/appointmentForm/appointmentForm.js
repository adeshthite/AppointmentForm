import { LightningElement,wire } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import appoappointment from '@salesforce/apex/AppointmentSlotApex.appoappointment';




export default class AppointmentForm extends LightningElement {

    searchkey;
    appointmentTime;

     dates;
     
     dateCount;

    @wire(appoappointment)
    wiredAppointments({ error, data }) {
        if (data) {
            this.dates = data;
            this.dateCount = data.length;
        } else if (error) {
            console.error('Error fetching appointments:', error);
        }
    }



   handleSubmit(event) {
     event.preventDefault();
        const fields = event.detail.fields;

        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

    handlchange(event) {
        this.searchkey = event.target.value;
        alert('is date' + searchkey);

    }

    



    handleSucess(event) {

         const updatedRecord = event.detail.id;
        console.log('onsuccess: ', updatedRecord);

        const event1 = new ShowToastEvent({
            title: 'Record is successfully',
            message: 'Toast Message',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(event1);
        this.dispatchEvent(new CloseActionScreenEvent());

    }


     
}