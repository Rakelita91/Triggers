trigger AnalysisCaseTrigger on Case (after insert, after update) {
    List<Task> tas = new List<Task>();
    List<Case> toProcess = null;
     switch on Trigger.operationType {
        when AFTER_INSERT {
            toProcess = Trigger.New;
        }
        when AFTER_UPDATE {
            toProcess = [SELECT CaseNumber, Status FROM Case
                         WHERE Id IN :Trigger.New];
        }
    }
      for(Case cas: toProcess){
        IF(cas.Status=='Aguardando Analise'){
            tas.add(new Task(Subject='New case to analyze: ' + cas.CaseNumber,WhatId=cas.Id));
        }
    }
    insert tas;
}