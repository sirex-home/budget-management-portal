package org.example.budget.controller;

import jakarta.websocket.server.PathParam;
import lombok.RequiredArgsConstructor;
import org.example.budget.dto.PageDto;
import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.service.BudgetService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class BudgetController {

    private final BudgetService budgetService;

    @GetMapping("/v1/budgets")
    public PageDto<BudgetEntity> getBudget(@RequestParam(value = "page", defaultValue = "0") Integer page) {
        PageDto<BudgetEntity> budgets = budgetService.getBudgets(page);
        return budgets;
    }

    @GetMapping("/v1/budgets/{id}/events")
    public List<BudgetEventWrapperEntity> getBudgetEvents(@PathParam("id") Long budgetId, @RequestParam("page") Integer page) {
        return budgetService.getEvents(budgetId, page);
    }

}
