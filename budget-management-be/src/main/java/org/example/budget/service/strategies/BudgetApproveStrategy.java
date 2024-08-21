package org.example.budget.service.strategies;

import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetStatus;
import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.example.budget.repository.entity.events.ApproveEventPayload;
import org.springframework.stereotype.Service;

@Service
public class BudgetApproveStrategy extends AbstractBudgetStrategy<ApproveEventPayload> {

    public Class<ApproveEventPayload> getTargetEvent() {
        return ApproveEventPayload.class;
    }

    @Override
    public BudgetEntity sourceEvent(BudgetEntity budget, AbstractEventPayload evt) {
        var event = (ApproveEventPayload) evt;
        budget.setStatus(BudgetStatus.APPROVED);
        return budget;
    }

}
