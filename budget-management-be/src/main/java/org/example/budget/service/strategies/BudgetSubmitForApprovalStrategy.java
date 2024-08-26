package org.example.budget.service.strategies;

import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.BudgetStatus;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.example.budget.repository.entity.events.SubmitForApprovalEventPayload;
import org.springframework.stereotype.Service;

@Service
public class BudgetSubmitForApprovalStrategy extends AbstractBudgetStrategy<SubmitForApprovalEventPayload> {

    public Class<SubmitForApprovalEventPayload> getTargetEvent() {
        return SubmitForApprovalEventPayload.class;
    }

    @Override
    public BudgetEntity sourceEvent(BudgetEntity budget, BudgetEventWrapperEntity evt) {
        var event = (SubmitForApprovalEventPayload) evt.getPayload();
        budget.setStatus(BudgetStatus.SUBMITTED_FOR_APPROVAL);
        return budget;
    }

}
