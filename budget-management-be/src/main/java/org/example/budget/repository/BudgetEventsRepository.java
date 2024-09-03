package org.example.budget.repository;

import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BudgetEventsRepository extends JpaRepository<BudgetEventWrapperEntity, Long> {

    List<BudgetEventWrapperEntity> findAllByBudgetIdOrderBySequenceNumber(Long budgetId, Pageable pageable);

    List<BudgetEventWrapperEntity> findAllByBudgetIdOrderBySequenceNumberDesc(Long budgetId, Pageable pageable);

}