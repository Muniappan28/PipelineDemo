public class UserApiCallout {
 //   @future(callout=true)
    public static HttpResponse getUserData() {
        try {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://jsonplaceholder.typicode.com/users/1');
            req.setMethod('GET');
            Http http = new Http();
            HttpResponse res = http.send(req);
            if(res.getStatusCode() == 200){
                User user = (User) JSON.deserialize(res.getBody(), User.class);
                System.debug('User Name: ' + user.name);
                System.debug('User Email: ' + user.email);
                System.debug('Street: ' + user.address.street);
                System.debug('City: ' + user.address.city);
                System.debug('Latitude: ' + user.address.geo.lat);
                System.debug('Company Name: ' + user.company.name);
                return res;
            }
        } catch(Exception e){
            System.debug('Error: ' + e.getMessage());
        }
        return null;
    }
}