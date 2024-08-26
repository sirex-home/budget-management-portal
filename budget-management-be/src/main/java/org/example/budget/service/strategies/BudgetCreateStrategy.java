package org.example.budget.service.strategies;

import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.BudgetStatus;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.example.budget.repository.entity.events.CreateEventPayload;
import org.springframework.stereotype.Service;

@Service
public class BudgetCreateStrategy extends AbstractBudgetStrategy<CreateEventPayload> {

    public Class<CreateEventPayload> getTargetEvent() {
        return CreateEventPayload.class;
    }

    @Override
    public BudgetEntity sourceEvent(BudgetEntity budget, BudgetEventWrapperEntity wrapper) {
        if (budget != null) {
            throw new RuntimeException("Budget creation strategy doesn't work with existed budgets");
        }
        var event = (CreateEventPayload) wrapper.getPayload();
        return BudgetEntity.builder()
                .title(event.getTitle())
                .amount(event.getAmount())
                .description(event.getDescription())
                .status(BudgetStatus.DRAFT)
                .createdAt(wrapper.getCreatedAt())
                .build();
    }

}
