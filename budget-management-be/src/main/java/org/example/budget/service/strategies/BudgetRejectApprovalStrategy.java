package org.example.budget.service.strategies;

import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.BudgetStatus;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.example.budget.repository.entity.events.RejectApprovalEventPayload;
import org.springframework.stereotype.Service;

@Service
public class BudgetRejectApprovalStrategy extends AbstractBudgetStrategy<RejectApprovalEventPayload> {

    public Class<RejectApprovalEventPayload> getTargetEvent() {
        return RejectApprovalEventPayload.class;
    }

    @Override
    public BudgetEntity sourceEvent(BudgetEntity budget, BudgetEventWrapperEntity evt) {
        var event = (RejectApprovalEventPayload) evt.getPayload();
        budget.setStatus(BudgetStatus.REJECTED);
        return budget;
    }

}
