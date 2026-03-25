public class OpportunityCleanupBatch implements Database.Batchable<SObject>, Database.Stateful {
    public Set<Id> processedOpportunityIds = new Set<Id>();
    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator('SELECT Id FROM Opportunity WHERE IsClosed = TRUE');
    }
    public void execute(Database.BatchableContext context, List<Opportunity> scope) {
        for (Opportunity opp : scope) {
            opp.Description = null;
        }
        List<Database.SaveResult> results = Database.update(scope, false);
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
                processedOpportunityIds.add(scope[i].Id); // Only collect successful records
            } else {
                System.debug('⚠️ Failed to update: ' + scope[i].Id + ' - ' + results[i].getErrors()[0].getMessage());
            }
        }
    }
    public void finish(Database.BatchableContext context) {
        System.debug('✅ Finished cleaning Opportunities. Chaining Task Cleanup.');
        if (!processedOpportunityIds.isEmpty()) {
            Database.executeBatch(new TaskCleanupBatch(processedOpportunityIds));
        }
    }
}