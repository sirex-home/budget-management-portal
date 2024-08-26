package org.example.budget.service.strategies;

import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.BudgetStatus;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.example.budget.repository.entity.events.UpdateEventPayload;
import org.springframework.stereotype.Service;

@Service
public class BudgetUprateStrategy extends AbstractBudgetStrategy<UpdateEventPayload> {

    public Class<UpdateEventPayload> getTargetEvent() {
        return UpdateEventPayload.class;
    }

    public BudgetEntity sourceEvent(BudgetEntity budget, BudgetEventWrapperEntity evt) {
        var event = (UpdateEventPayload) evt.getPayload();
        budget.setStatus(BudgetStatus.DRAFT);
        if (event.getAmount() != null) {
            budget.setAmount(event.getAmount());
        }
        if (event.getTitle() != null) {
            budget.setTitle(event.getTitle());
        }
        if (event.getDescription() != null) {
            budget.setDescription(event.getDescription());
        }
        return budget;
    }

}
