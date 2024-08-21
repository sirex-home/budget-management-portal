package org.example.budget.service;

import org.example.budget.repository.entity.events.AbstractEventPayload;
import org.example.budget.service.strategies.AbstractBudgetStrategy;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service
public class BudgetStrategySelector<Payload extends AbstractEventPayload> {

    private Map<Class<Payload>, AbstractBudgetStrategy<Payload>> strategiesRegistry = new HashMap<>();

    public BudgetStrategySelector(Collection<AbstractBudgetStrategy<Payload>> strategies) {
        for (AbstractBudgetStrategy<Payload> strategy : strategies) {
            strategiesRegistry.put(strategy.getTargetEvent(), strategy);
        }
    }

    public AbstractBudgetStrategy<Payload> getStrategy(AbstractEventPayload payload) {
        return strategiesRegistry.get(payload.getClass());
    }

}
