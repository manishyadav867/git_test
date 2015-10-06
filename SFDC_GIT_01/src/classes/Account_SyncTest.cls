//************************************************************************************
// Name             : Account_SyncTest 
// Description      : Test Class for Account_Sync Trigger.

// ************************Version Updates********************************************
// Date         Developer               Description
// -----------------------------------------------------------------------------------
// CR-12345     Test-VMware             GITHUB_TEST
// ************************************************************************************

@isTest(seealldata = true)
public class Account_SyncTest {

             
     public static testMethod void SyncAccountTest(){
      
        List<Account> acc = new List<Account>();  
        Map<String, String> requestAccountRequestMaps = new Map<String, String>();
      

      
                 test.starttest();
                 User u2 = [SELECT id FROM User WHERE Name  ='AST-UCM Integration User'];
                 System.RunAs(u2) {

                 acc.add(new Account(ACR_Number__c = 'ACR-003453',Name='testname',BillingStreet = 'teststreet',VMW_Address_Line_2__c= 'testAddrss2',Region__c = 'testregion',BillingCity = 'testCity',VMware_Site_UUID__c = '453657',Parent_Ult_Duns__c = '3728832',Geo__c = 'APAC',Country__c = 'India'));
                 insert acc;
                 }
                 
                 for(Account acctest : acc){
                        requestAccountRequestMaps.put('ACR Number',String.valueOf(acctest.ACR_Number__c));
                        requestAccountRequestMaps.put('Address 1',acctest.BillingStreet);
                        requestAccountRequestMaps.put('Address 2',acctest.VMW_Address_Line_2__c);
                        requestAccountRequestMaps.put('Account GEO',acctest.Region__c);
                        requestAccountRequestMaps.put('City',acctest.BillingCity);
                        requestAccountRequestMaps.put('DUNS',acctest.DUNS_NUM__c);
                        requestAccountRequestMaps.put('State / Province',acctest.BillingState);
                        requestAccountRequestMaps.put('UUID',acctest.VMware_Site_UUID__c);
                        requestAccountRequestMaps.put('Global Ult DUNS',acctest.Global_Ult_Duns__c);
                        requestAccountRequestMaps.put('Parent Ult DUNS',acctest.Parent_Ult_Duns__c);
                        requestAccountRequestMaps.put('Postal Code',acctest.BillingPostalCode);
                        requestAccountRequestMaps.put('Customer ID',acctest.Id);
                        requestAccountRequestMaps.put('Industry',acctest.Industry_New__c);
                        requestAccountRequestMaps.put('Website',acctest.Website);
                        requestAccountRequestMaps.put('Country',acctest.Country__c);
                        requestAccountRequestMaps.put('Account Name(CM) - Airtwach',acctest.Name);
                        requestAccountRequestMaps.put('RequestSource','Account');
                        requestAccountRequestMaps.put('RequestedByEmail',  UserInfo.getUserEmail());
                       
                    }
                  AWVMstarUtility.createAccountRequestMain(requestAccountRequestMaps,true,null);
                 test.stoptest();
                
                                                     
                                                            
                                                            
      }                                                      
                                                            
                                                            
                                                            
                                                            
          public void test(){
          
          	system.debug("hiiiiiii");
          
          }                                                  
            
            
            public void test1(){
          
          	system.debug("hiiiiiii");
          
          }                                                 
                                                            
                                          
           
             public void test2(){
          
          	system.debug("hiiiiiii");
          
          }                                                    
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            

}