package org.example.budget.repository.entity;

import com.vladmihalcea.hibernate.type.json.JsonType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.hibernate.annotations.Type;

@Entity
@Table(name = "budget_events")
@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class BudgetEventWrapperEntity extends AuditableEventEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    private Long budgetId;

    private Long sequenceNumber;

    @Type(JsonType.class)
    private AbstractEventPayload payload;

}
