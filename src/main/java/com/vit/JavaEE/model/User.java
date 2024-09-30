package com.vit.JavaEE.model;


import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
	
    @Id
    @Column(name = "email", nullable = false, unique = true, length = 191)
    private String email;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "password", nullable = false)
    private String password;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public User(String email, String fullName, String role, String password) {
		super();
		this.email = email;
		this.fullName = fullName;
		this.role = role;
		this.password = password;
	}

	public User() {
	
	}
    
    
}
