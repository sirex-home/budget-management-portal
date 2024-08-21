package org.example.budget.service;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.example.budget.repository.BudgetEventsRepository;
import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.events.*;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BudgetService {

    private final BudgetEventsRepository budgetEventsRepository;
    private final BudgetStrategySelector budgetStrategySelector;

    @Transactional
    public BudgetEntity createBudget(CreateEventPayload evt) {
        var strategy = budgetStrategySelector.getStrategy(evt);
        return strategy.applyEvent(null, evt);
    }

    @Transactional
    public BudgetEntity updateBudget(Long budgetId, UpdateEventPayload evt) {
        var strategy = budgetStrategySelector.getStrategy(evt);
        return strategy.applyEvent(budgetId, evt);
    }

    @Transactional
    public BudgetEntity submitBudgetForApproval(Long budgetId, SubmitForApprovalEventPayload evt) {
        var strategy = budgetStrategySelector.getStrategy(evt);
        return strategy.applyEvent(budgetId, evt);
    }

    @Transactional
    public BudgetEntity rejectBudget(Long budgetId, RejectApprovalEventPayload evt) {
        var strategy = budgetStrategySelector.getStrategy(evt);
        return strategy.applyEvent(budgetId, evt);
    }

    @Transactional
    public BudgetEntity approveBudget(Long budgetId, ApproveEventPayload evt) {
        var strategy = budgetStrategySelector.getStrategy(evt);
        return strategy.applyEvent(budgetId, evt);
    }

    public BudgetEntity sourceBudget(Long budgetId) {
        int page = 0;
        boolean continueSourcing = true;
        BudgetEntity budget = null;
        int PAGE_SIZE = 5;
        while (continueSourcing) {
            List<BudgetEventWrapperEntity> events = budgetEventsRepository
                    .findAllByBudgetIdOrderBySequenceNumber(budgetId, PageRequest.of(page++, PAGE_SIZE));
            for (BudgetEventWrapperEntity event : events) {
                var strategy = budgetStrategySelector.getStrategy(event.getPayload());
                budget = strategy.sourceEventWrapper(budget, event);
            }
            continueSourcing = events.size() == PAGE_SIZE;
        }
        budget.setId(budgetId);
        return budget;
    }

}
