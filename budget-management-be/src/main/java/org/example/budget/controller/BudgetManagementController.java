package org.example.budget.controller;

import lombok.RequiredArgsConstructor;
import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.events.*;
import org.example.budget.service.BudgetService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class BudgetManagementController {

    private final BudgetService budgetService;

    @PostMapping("/v1/budgets")
    public BudgetEntity createBudget(@RequestBody CreateEventPayload cmd) {
        return budgetService.createBudget(cmd);
    }

    @PutMapping("/v1/budgets/{id}")
    public BudgetEntity updateBudget(@PathVariable("id") Long id, @RequestBody UpdateEventPayload cmd) {
        return budgetService.updateBudget(id, cmd);
    }

    @PutMapping("/v1/budgets/{id}/submit-for-approval")
    public BudgetEntity submitBudgetForApproval(@PathVariable("id") Long id, @RequestBody SubmitForApprovalEventPayload cmd) {
        return budgetService.submitBudgetForApproval(id, cmd);
    }

    @PutMapping("/v1/budgets/{id}/approve")
    public BudgetEntity approveBudget(@PathVariable("id") Long id, @RequestBody ApproveEventPayload cmd) {
        return budgetService.approveBudget(id, cmd);
    }

    @PutMapping("/v1/budgets/{id}/reject")
    public BudgetEntity rejectBudgetForApproval(@PathVariable("id") Long id, @RequestBody RejectApprovalEventPayload cmd) {
        return budgetService.rejectBudget(id, cmd);
    }

    @GetMapping("/v1/budgets/{id}")
    public BudgetEntity sourceBudget(@PathVariable("id") Long id) {
        return budgetService.sourceBudget(id);
    }

}
