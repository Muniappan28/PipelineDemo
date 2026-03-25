public class User {
    public Integer id;
    public String name;
    public String email;
    public Address address;
    public Company company;
    public class Address {
        public String street;
        public String city;
        public Geo geo;
    }
    public class Geo {
        public String lat;
        public String lng;
    }
    public class Company {
        public String name;
        public String bs;
    }
}