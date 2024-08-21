package org.example.budget.repository;

import org.example.budget.repository.entity.BudgetEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BudgetsRepository extends JpaRepository<BudgetEntity, Long> {
}