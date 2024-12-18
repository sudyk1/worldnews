package pl.sudyk.worldnews.domain.user;

import java.time.LocalDateTime;

public class User {
    private Integer id;
    private String username;
    private String email;
    private String password;
    private LocalDateTime registrationDate;

    public User(Integer id, String username, String email, String password, LocalDateTime registrationDate) {
        this(username, email, password, registrationDate);
        this.id = id;
    }

    public User(String username, String email, String password, LocalDateTime registrationDate) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.registrationDate = registrationDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String sha256Password) {
        this.password = sha256Password;
    }

    public LocalDateTime getRegistrationDate() {
        return registrationDate;
    }
}
