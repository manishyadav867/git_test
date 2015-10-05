/*===============================================================================================
Purpose:
--------
    Trigger to Send Parameters to VMstar to update Account Request on Account creation/updation..
=================================================================================================
=================================================================================================
History
-------
VERSION        CR#                              AUTHOR                  DATE              DETAIL              
1.0        CR-00134988/CR-00135343          Sanjib Mahanta         24-June-2015      Initial Development                         
*************************************************************************************************/ 
trigger Account_sync on Account (after insert, after update){
	
    private static String astUcmUser = 'AST-UCM Integration User';
    public Map<String, String> requestAccountRequestMaps = new Map<String, String>();
    Map<Id,Account> accMap = new Map<Id, Account>([Select Id, LastModifiedBy.Name From Account where Id IN: Trigger.new]);
    
        for(Account acc : Trigger.new){                                    
                 if((Trigger.isInsert && acc.ACR_Number__c != null && accMap.get(acc.Id).LastModifiedBy.Name == astUcmUser ) || (Trigger.isUpdate && acc.ACR_Number__c != null && accMap.get(acc.Id).LastModifiedBy.Name == astUcmUser) ){
                    
                    requestAccountRequestMaps.put('ACR Number',String.valueOf(acc.ACR_Number__c));
                    requestAccountRequestMaps.put('Address 1',acc.BillingStreet);
                    requestAccountRequestMaps.put('Address 2',acc.Billing_Adress_Line_2__c);
                    requestAccountRequestMaps.put('Account GEO',acc.Region__c);
                    requestAccountRequestMaps.put('City',acc.BillingCity);
                    requestAccountRequestMaps.put('DUNS',acc.DUNS_NUM__c);
                    requestAccountRequestMaps.put('State / Province',acc.BillingState);
                    requestAccountRequestMaps.put('UUID',acc.VMware_Site_UUID__c);
                    requestAccountRequestMaps.put('Global Ult DUNS',acc.Global_Ult_Duns__c);
                    requestAccountRequestMaps.put('Parent Ult DUNS',acc.Parent_Ult_Duns__c);
                    requestAccountRequestMaps.put('Postal Code',acc.BillingPostalCode);
                    requestAccountRequestMaps.put('Customer ID',acc.Id);
                    requestAccountRequestMaps.put('Industry',acc.Industry_New__c);
                    requestAccountRequestMaps.put('Website',acc.Website);
                    requestAccountRequestMaps.put('Country',acc.Country__c);
                    requestAccountRequestMaps.put('Account Name(CM) - Airtwach',acc.Name);              
                }        
        }   
            if(!requestAccountRequestMaps.isEmpty()){ 
                    AWVMstarUtility.createAccountRequestMain(requestAccountRequestMaps,true,null);
            }        
}