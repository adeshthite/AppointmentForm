public class Appointment_DetailTimeApex {
    
     public static void AppointmentDetail(List<Appointment_Detail__c>acclist){
        List<Appointment_Detail__c> existingDateAndTime=[Select Id,Appointment_Date__c,Appointment_Time__c From Appointment_Detail__c];
        
        for(Appointment_Detail__c con:acclist){
            
            for(Appointment_Detail__c existreco:existingDateAndTime){
                
                if(con.Appointment_Time__c == existreco.Appointment_Time__c & con.Appointment_Date__c == existreco.Appointment_Date__c){
                    con.addError('This Slot time is already exit:'+con.Appointment_Date__c+''+con.Appointment_Time__c);
                }
            }
            
        }
    }


}