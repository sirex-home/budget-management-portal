package org.example.budget.repository.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.Instant;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class AuditableEntity {

    @CreatedDate
    @Column(name = "created_at")
    protected Instant createdAt;

    @Column(name = "updated_at")
    @LastModifiedDate
    protected Instant updatedAt;

    @Column(name = "updated_by")
    @LastModifiedBy
    protected String updatedByUserId;

    @Version
    @Column(name = "version", nullable = false)
    @JsonIgnore
    protected Long version;

}
