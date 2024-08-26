package org.example.budget.service;

import org.example.budget.repository.entity.BudgetEntity;
import org.example.budget.repository.entity.BudgetEventWrapperEntity;
import org.example.budget.repository.entity.BudgetStatus;
import org.example.budget.repository.entity.events.*;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Mocker {

    private static String loremIpsum(int words) {
        String[] splitted = "Lorem  eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                .split(" ");
        return String.join(" ", List.of(splitted).subList(0, Math.min(words, splitted.length)));
    }

    private static List<BudgetEntity> mockedBudgets() {
        List<BudgetEntity> result = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            result.addAll(List.of(
                    BudgetEntity.builder().id(1L).lastEventNumber(2L).title("Summer school budget").description(loremIpsum(15)).amount(BigDecimal.valueOf(52_000)).status(BudgetStatus.APPROVED).createdAt(Instant.now()).updatedAt(Instant.now()).updatedByUserId(12994L).build(),
                    BudgetEntity.builder().id(12L).lastEventNumber(12L).title("New Year budget").description(loremIpsum(5)).amount(BigDecimal.valueOf(125_232)).status(BudgetStatus.APPROVED).createdAt(Instant.now()).updatedAt(Instant.now()).updatedByUserId(12994L).build(),
                    BudgetEntity.builder().id(31L).lastEventNumber(77L).title("NORAD budget").description(loremIpsum(50)).amount(BigDecimal.valueOf(4_311_200_000L)).status(BudgetStatus.DRAFT).createdAt(Instant.now()).updatedAt(Instant.now()).updatedByUserId(1000L).build(),
                    BudgetEntity.builder().id(56L).lastEventNumber(19L).title("Oslo property budget").description(loremIpsum(5)).amount(BigDecimal.valueOf(63_000)).status(BudgetStatus.DRAFT).createdAt(Instant.now()).updatedAt(Instant.now()).updatedByUserId(1000L).build(),
                    BudgetEntity.builder().id(91L).lastEventNumber(14L).title("Medicine budget").description(loremIpsum(23)).amount(BigDecimal.valueOf(13_000)).status(BudgetStatus.APPROVED).createdAt(Instant.now()).updatedAt(Instant.now()).updatedByUserId(12994L).build()
            ));
        }
        return result;
    }

    public static List<BudgetEntity> mockedBudgets = mockedBudgets();


    private static List<BudgetEventWrapperEntity> mockedEvents() {
        List<BudgetEventWrapperEntity> result = new ArrayList<>();
        result.add(new BudgetEventWrapperEntity(1L, 12L, 13L,
                new CreateEventPayload("New Year budget", "test" , BigDecimal.valueOf(421234L))));
        Random random = new Random();
        double chance = Math.random();
        for (long i = 0; i < 100; i++) {
            long amount = random.nextLong(42_000_000);
            if (chance < 0.7) {
                result.add(new BudgetEventWrapperEntity(i, 12L, 13L,
                        new UpdateEventPayload("New Year budget", "test", BigDecimal.valueOf(amount))));
            } else if (chance < 0.8) {
                result.add(new BudgetEventWrapperEntity(i, 12L, 13L,
                        new SubmitForApprovalEventPayload("super_manager")));
            } else if (chance < 0.9) {
                result.add(new BudgetEventWrapperEntity(i, 12L, 13L,
                        new RejectApprovalEventPayload()));
            } else {
                result.add(new BudgetEventWrapperEntity(i, 12L, 13L,
                        new ApproveEventPayload()));
            }
        }
        return result;
    }

    public static List<BudgetEventWrapperEntity> mockedEvents = mockedEvents();

}
