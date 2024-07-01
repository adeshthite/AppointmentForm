trigger AppointmentSlot on Appointment_Slot__c (before insert) {
    
    if(trigger.isInsert && trigger.isbefore){
        AppointmentSlotDateAndTime.appointment(trigger.new);
        
    }

}

// Apex Class
public class AppointmentSlotDateAndTime {
    
    public static void appointment(List<Appointment_Slot__c>acclist){
        List<Appointment_Slot__c> existingDateAndTime=[Select Id,Start_Time__c,Appointment_Date__c From Appointment_Slot__c];
        
        for(Appointment_Slot__c con:acclist){
            
            for(Appointment_Slot__c existreco:existingDateAndTime){
                
                if(con.Start_Time__c == existreco.Start_Time__c & con.Appointment_Date__c == existreco.Appointment_Date__c){
                    con.addError('This Slot time is already exit:'+con.Appointment_Date__c+''+con.Start_Time__c);
                }
            }
            
        }
    }

}
