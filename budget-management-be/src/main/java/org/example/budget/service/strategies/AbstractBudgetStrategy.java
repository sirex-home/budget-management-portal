package org.example.budget.service.strategies;

import org.example.budget.repository.BudgetEventsRepository;
import org.example.budget.repository.BudgetsRepository;
import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.Instant;

public abstract class AbstractBudgetStrategy <Event extends AbstractEventPayload> {

    @Autowired
    private BudgetsRepository budgetsRepository;

    @Autowired
    private BudgetEventsRepository budgetEventsRepository;


    public abstract Class<Event> getTargetEvent();

    protected abstract BudgetEntity sourceEvent(BudgetEntity budget, BudgetEventWrapperEntity event);

    public BudgetEntity sourceEventWrapper(BudgetEntity budget, BudgetEventWrapperEntity wrapper) {
        budget = sourceEvent(budget, wrapper);
        budget.setUpdatedAt(wrapper.getCreatedAt());
        budget.setUpdatedByUserId(wrapper.getCreatedByUserId());
        budget.setLastEventNumber(wrapper.getSequenceNumber());
        return budget;
    }

    public BudgetEntity applyEvent(Long budgetId, Event event) {
        BudgetEntity budget = budgetId == null ? null : budgetsRepository.findById(budgetId).orElseThrow();

        BudgetEventWrapperEntity evtWrapper = BudgetEventWrapperEntity.builder()
                .budgetId(budget == null ? null : budget.getId())
                .payload(event)
                .sequenceNumber(budget == null ? 1L : budget.getLastEventNumber() + 1)
                .createdAt(Instant.now())
                .createdByUserId(123L) // TODO KG
                .build();

        budget = sourceEventWrapper(budget, evtWrapper);
        budget = budgetsRepository.save(budget);

        if (evtWrapper.getBudgetId() == null) {
            evtWrapper.setBudgetId(budget.getId());
        }

        budgetEventsRepository.save(evtWrapper);
        return budget;
    }
}
