@isTest
public class ImportPedidoTest {
    @isTest
    static void PedidoTest() {
        Opportunity opp = new Opportunity(Name='Opp Test', StageName='Envio da Proposta', CloseDate=system.today());
        insert opp;
        //Order ord = new Order(AccountId='001HZ000002G66jYAC',EffectiveDate=system.today(),Status='Draft',ContractId='800HZ00000EY3LGYA1', Oportunidade__c=opp.Id);
        Order ord = new Order(AccountId='0011U00001KEH7DQAX',EffectiveDate=system.today(),Status='Draft', Oportunidade__c=opp.Id);
        insert ord;
        Importa_o__c imp = new Importa_o__c(Oportunidade__c=opp.Id);
        String oport = imp.Oportunidade__c;

        Test.startTest();
        Database.SaveResult result = Database.insert(imp,false);
        if(oport!=NULL){
            ord = [SELECT Name, OrderNumber, Oportunidade__r.Name FROM Order WHERE Oportunidade__r.Id=:oport];
        }
        imp.Pedido_texto__c = ord.OrderNumber;
        Test.stopTest();
        System.assert(!result.isSuccess());

    }
}
