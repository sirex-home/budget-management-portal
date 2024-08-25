package org.example.budget.repository.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.math.BigDecimal;

@Entity
@Table(name = "budgets")
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class BudgetEntity extends AuditableEntity {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @Builder.Default
    private Long lastEventNumber = 0L;

    private String title;

    private String description;

    private BigDecimal amount;

    @Builder.Default
    @Enumerated(EnumType.STRING)
    private BudgetStatus status = BudgetStatus.DRAFT;

}
