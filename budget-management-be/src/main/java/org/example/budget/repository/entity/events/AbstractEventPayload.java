package org.example.budget.repository.entity.events;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import lombok.Data;

@Data
@JsonTypeInfo(
        use = JsonTypeInfo.Id.NAME, property = "type", visible = true)
@JsonSubTypes({
        @JsonSubTypes.Type(value = CreateEventPayload.class, name = "CREATE"),
        @JsonSubTypes.Type(value = UpdateEventPayload.class, name = "UPDATE"),
        @JsonSubTypes.Type(value = SubmitForApprovalEventPayload.class, name = "SUBMIT_FOR_APPROVAL"),
        @JsonSubTypes.Type(value = RejectApprovalEventPayload.class, name = "REJECT_APPROVAL"),
        @JsonSubTypes.Type(value = ApproveEventPayload.class, name = "APPROVE")
})
public abstract class AbstractEventPayload {

    private String type;

    private Long sequenceNumber;

}
