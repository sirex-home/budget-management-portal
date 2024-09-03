package org.example.budget.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

class BudgetManagementApplicationTests extends BaseIntegrationTest {

    @Autowired
    private ClientSimulator clientSimulator;

    @Test
    void testBudgetAcceptedFlow() {
        ResponseEntity<Map> creationResult = clientSimulator.createBudget("Super budget", 1000, "Some initial");
        assertThat(creationResult.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map body = creationResult.getBody();
        Integer budgetId = (Integer) body.get("id");
        assertThat(budgetId).isNotNull();
        assertThat((String) body.get("status")).isEqualTo("DRAFT");
        assertThat((Integer) body.get("amount")).isEqualTo(1000);

        ResponseEntity<Map> updateResult = clientSimulator.updateBudget(budgetId, 2000, "Some initial");
        assertThat(updateResult.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map updateResultBody = updateResult.getBody();
        assertThat((String) updateResultBody.get("status")).isEqualTo("DRAFT");
        assertThat((Integer) updateResultBody.get("amount")).isEqualTo(2000);

        ResponseEntity<Map> submissionResult = clientSimulator.submitForApproval(budgetId);
        assertThat(submissionResult.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map submissionResultBody = submissionResult.getBody();
        assertThat((String) submissionResultBody.get("status")).isEqualTo("SUBMITTED_FOR_APPROVAL");

        ResponseEntity<Map> rejectionResult = clientSimulator.rejectBudget(budgetId);
        assertThat(rejectionResult.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map rejectionResultBody = rejectionResult.getBody();
        assertThat((String) rejectionResultBody.get("status")).isEqualTo("REJECTED");

        String updatedDescription = "Updated description";
        ResponseEntity<Map> secondUpdateResult = clientSimulator.updateBudget(budgetId, 3000, updatedDescription);
        assertThat(secondUpdateResult.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map secondUpdateResultBody = secondUpdateResult.getBody();
        assertThat((String) secondUpdateResultBody.get("status")).isEqualTo("DRAFT");
        assertThat((Integer) secondUpdateResultBody.get("amount")).isEqualTo(3000);

        ResponseEntity<Map> approvalResult = clientSimulator.approve(budgetId);
        assertThat(approvalResult.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map approvedResultBody = approvalResult.getBody();
        assertThat((String) approvedResultBody.get("status")).isEqualTo("APPROVED");


        ResponseEntity<Map> sourcedResult = clientSimulator.sourceBudget(budgetId);
        assertThat(sourcedResult.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map sourcedResultBody = sourcedResult.getBody();
//        assertThat((String) approvedResultBody.get("status")).isEqualTo("APPROVED");

        System.out.println("Finish");
    }

}
