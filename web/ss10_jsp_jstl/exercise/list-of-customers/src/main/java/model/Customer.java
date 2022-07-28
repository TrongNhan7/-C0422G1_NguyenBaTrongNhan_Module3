package model;

import java.time.LocalDate;

public class Customer {
private String name;
private LocalDate age;
private String address;
private String url;

    public Customer() {
    }

    public Customer(String name, LocalDate age, String address, String url) {
        this.name = name;
        this.age = age;
        this.address = address;
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getAge() {
        return age;
    }

    public void setAge(LocalDate age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
