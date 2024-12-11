trigger SNReposicaoCopiarColar on Case (before insert, before update) {
    String nomeid;
    for(Case cas : Trigger.new){
        nomeid = cas.Serial_do_inversor_de_reposi_o_Lookup__c;
        Importa_o__c imp = new Importa_o__c();
        if(cas.Serial_do_inversor_de_reposi_o_Lookup__c!=NULL){
            imp = [SELECT Name FROM Importa_o__c WHERE Id=:nomeid];
        }
        if(cas.RecordTypeId == '0121U000000eAvcQAE'){
           cas.Serial_do_inversor_de_reposi_o__c = imp.Name;
        }
    }
}