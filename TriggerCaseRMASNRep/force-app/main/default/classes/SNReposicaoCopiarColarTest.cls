@isTest
private class SNReposicaoCopiarColarTest {

    @isTest
    static void CopiarColarSNTest() {
        Importa_o__c imp = new Importa_o__c();
        Case c = new Case(Subject='Test for the trigger - RMA', RecordTypeId='0121U000000eAvcQAE', Origin='Interno', Serial_do_inversor_de_reposi_o_Lookup__c = imp.Id);
        String nomeId = c.Serial_do_inversor_de_reposi_o_Lookup__c;
        Test.startTest();
        Database.SaveResult result = Database.insert(c,false);
        if(c.Serial_do_inversor_de_reposi_o_Lookup__c!=NULL){
            imp = [SELECT Name FROM Importa_o__c WHERE Id=:nomeId];
        }
        c.Description = imp.Name; 
        Test.stopTest();
        System.assert(result.isSuccess());
    }
}