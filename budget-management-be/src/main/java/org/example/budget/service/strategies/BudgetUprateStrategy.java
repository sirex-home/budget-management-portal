package org.example.budget.service.strategies;

import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetStatus;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.example.budget.repository.entity.events.UpdateEventPayload;
import org.springframework.stereotype.Service;

@Service
public class BudgetUprateStrategy extends AbstractBudgetStrategy<UpdateEventPayload> {

    public Class<UpdateEventPayload> getTargetEvent() {
        return UpdateEventPayload.class;
    }

    public BudgetEntity sourceEvent(BudgetEntity budget, AbstractEventPayload evt) {
        var event = (UpdateEventPayload) evt;
        budget.setStatus(BudgetStatus.DRAFT);
        budget.setAmount(event.getAmount());
        budget.setDescription(event.getDescription());
        return budget;
    }

}
