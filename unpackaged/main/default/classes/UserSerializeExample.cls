public class UserSerializeExample {
    public static String getDetails(){
        User u=new User();
        u.Id=123;
        u.Name='muni';
        u.Email='muni@gmail.com';
        u.Address=new User.Address();
        u.Address.street='salem';
        u.Address.Geo=new User.Geo();
        u.Address.Geo.lat='12jd';
        u.Address.Geo.lng='3sd';
        String json =JSON.serialize(u);
        System.debug(json);
        return json;
    }
}