package org.example.budget.repository.entity.events;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class CreateEventPayload extends AbstractEventPayload {

    private String title;

    private String description;

    private BigDecimal amount;

}
