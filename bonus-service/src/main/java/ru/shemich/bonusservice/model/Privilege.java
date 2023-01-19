package ru.shemich.bonusservice.model;

import lombok.Data;
import lombok.experimental.FieldDefaults;
import ru.shemich.bonusservice.api.response.enums.Status;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;
import static lombok.AccessLevel.PRIVATE;

@Data
@Entity
@FieldDefaults(level = PRIVATE)
@Table(name = "privilege")
public class Privilege {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    Long id;
    @Column(name = "username", length = 80)
    String username;
    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    Status status;
    @Column(name = "balance")
    Integer balance;
}
