package model;

import lombok.*;

@Getter @Setter @AllArgsConstructor @NoArgsConstructor @Builder
public class User {
    protected int id;
    protected String name;
    protected String email;
    protected String country;

}