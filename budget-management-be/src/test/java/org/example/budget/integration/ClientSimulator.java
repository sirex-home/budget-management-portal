package org.example.budget.integration;

import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.context.annotation.Profile;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@Profile(BaseIntegrationTest.PROFILE_INTEGRATION_TEST)
public class ClientSimulator {

    private final TestRestTemplate rest;

    public ClientSimulator(TestRestTemplate rest) {
        this.rest = rest;
    }

    public ResponseEntity<Map> createBudget(Integer amount, String description) {
        var requestEntity = RequestEntity.post("/api/v1/budgets")
                .body(Map.of(
                        "type", "CREATE",
                        "amount", amount,
                        "description", description
                ));

        return rest.exchange(requestEntity, Map.class);
    }

    public ResponseEntity<Map> updateBudget(Integer budgetId, Integer amount, String description) {
        var requestEntity = RequestEntity.put("/api/v1/budgets/" + budgetId)
                .body(Map.of(
                        "type", "UPDATE",
                        "amount", amount,
                        "description", description
                ));
        return rest.exchange(requestEntity, Map.class);
    }

    public ResponseEntity<Map> submitForApproval(Integer budgetId) {
        var requestEntity = RequestEntity.put("/api/v1/budgets/" + budgetId + "/submit-for-approval")
                .body(Map.of(
                        "type", "SUBMIT_FOR_APPROVAL"
                ));
        return rest.exchange(requestEntity, Map.class);
    }

    public ResponseEntity<Map> approve(Integer budgetId) {
        var requestEntity = RequestEntity.put("/api/v1/budgets/" + budgetId + "/approve")
                .body(Map.of(
                        "type", "APPROVE"
                ));
        return rest.exchange(requestEntity, Map.class);
    }

    public ResponseEntity<Map> rejectBudget(Integer budgetId) {
        var requestEntity = RequestEntity.put("/api/v1/budgets/" + budgetId + "/reject")
                .body(Map.of(
                        "type", "REJECT_APPROVAL"
                ));

        return rest.exchange(requestEntity, Map.class);
    }

    public ResponseEntity<Map> sourceBudget(Integer budgetId) {
        var requestEntity = RequestEntity.get("/api/v1/budgets/" + budgetId).build();
        return rest.exchange(requestEntity, Map.class);
    }

}