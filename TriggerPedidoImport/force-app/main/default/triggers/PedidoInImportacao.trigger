trigger PedidoInImportacao on Importa_o__c (before insert, before update) {
    String oport;
    for(Importa_o__c imp :Trigger.new){
        oport = imp.Oportunidade__c;
        Opportunity opp = new Opportunity();
        Order ord = new Order();
        if(oport!=NULL){
            ord = [SELECT Name, OrderNumber, Oportunidade__r.Name FROM Order WHERE Oportunidade__r.Id=:oport];
            imp.Pedido_texto__c = ord.OrderNumber;
        }
    }

}