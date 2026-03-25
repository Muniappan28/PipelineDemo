global class PremiumAccountBatch implements Database.Batchable<SObject>, Database.Stateful {
    global Integer premiumCount = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
	System.debug('Total Premium Accounts: ' + premiumCount);
        return Database.getQueryLocator(
            'SELECT Id, Name, AnnualRevenue FROM Account'
        );
    }
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        System.debug('Total Premium Accounts: ' + premiumCount);
        List<Account> updateAccounts = new List<Account>();
        for(Account acc : scope){
            if(acc.AnnualRevenue != null && acc.AnnualRevenue > 1000000){
                acc.Type = 'Premium';
                updateAccounts.add(acc);
                premiumCount++;
            }
        }
        if(updateAccounts.size() > 0){
			System.debug('Total Premium Accounts: ' + premiumCount);
            update updateAccounts;
        }
    }
    global void finish(Database.BatchableContext bc){

        System.debug('Total Premium Accounts: ' + premiumCount);

    }
}