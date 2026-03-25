public class QUEUEABLEapex implements queueable,Database.allowsCallouts{
    public static void execute(QueueableContext q){
         System.debug('1');
        Http h=new Http();
                 System.debug('2');

        HttpRequest hrt=new HttpRequest();
                 System.debug('3');

        hrt.setEndpoint('https://restcountries.com/v3.1/name/France');
                 System.debug('4');
        hrt.setMethod('GET');
                 System.debug('5');

        HttpResponse hrs=h.send(hrt);
                         System.debug('6');

        System.debug(hrs.getBody());
    }
}