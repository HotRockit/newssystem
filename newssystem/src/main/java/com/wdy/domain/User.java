package com.wdy.domain;


import lombok.Data;

@Data
public class User {
    private int userid;
    private String username;
    private String password;
    private int userlevel;
}
