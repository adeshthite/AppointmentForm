public class AppointmentSlotApex {

    @AuraEnabled(cacheable=true)
    public static List<Date> appoappointment() {
        List<Date> dates = new List<Date>();
        
        List<Appointment_Slot__c> slots = [SELECT Appointment_Date__c FROM Appointment_Slot__c WHERE isActive__c = TRUE];
        
        for (Appointment_Slot__c slot : slots) {
            dates.add(slot.Appointment_Date__c); 
        }
        
        return dates;
    }
    
}