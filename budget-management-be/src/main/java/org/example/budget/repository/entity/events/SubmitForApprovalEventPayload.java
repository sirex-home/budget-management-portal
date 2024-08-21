package org.example.budget.repository.entity.events;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class SubmitForApprovalEventPayload extends AbstractEventPayload {

    private String authoritativeUserId;

}
