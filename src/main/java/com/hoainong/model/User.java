package com.hoainong.model;

import java.util.Date;
import java.util.List;



import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.UniqueConstraint;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "users", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"email", "phone"})
})
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID;

    @NotBlank
    @Size(max = 100)
    @Column(name = "fullName")
    private String fullName;

    @NotBlank
    @Size(max = 20)
    @Column(name = "phone")
    private String phone;

    @NotBlank
    @Email
    @Size(max = 100)
    @Column(name = "email")
    private String email;

    @NotBlank
    @Size(max = 100)
    @Column(name = "password")
    private String password;

    @Column(name = "address")
    private String address;

    @Temporal(TemporalType.DATE)
    @Column(name = "createDate")
    private Date createDate = new Date();

    @Column(name = "admin")
    private Boolean admin = Boolean.FALSE;

    @Column(name = "active")
    private Boolean active = Boolean.TRUE;

    @Column(name = "photo")
    private String photo;

    @NotNull
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(TemporalType.DATE)
    @Column(name = "`birthday`")
    private Date birthday;

    @NotNull
    @Column(name = "gender")
    private Boolean gender;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Invoice> invoices;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Feedback> feedbacks;
}
