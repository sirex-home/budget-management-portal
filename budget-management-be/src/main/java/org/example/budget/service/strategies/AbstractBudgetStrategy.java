package org.example.budget.service.strategies;

import org.example.budget.repository.BudgetEventsRepository;
import org.example.budget.repository.BudgetsRepository;
import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractBudgetStrategy <Event extends AbstractEventPayload> {

    @Autowired
    private BudgetsRepository budgetsRepository;

    @Autowired
    private BudgetEventsRepository budgetEventsRepository;


    public abstract Class<Event> getTargetEvent();

    public abstract BudgetEntity sourceEvent(BudgetEntity budget, AbstractEventPayload event);

    public BudgetEntity sourceEventWrapper(BudgetEntity budget, BudgetEventWrapperEntity wrapper) {
        budget = sourceEvent(budget, wrapper.getPayload());
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
