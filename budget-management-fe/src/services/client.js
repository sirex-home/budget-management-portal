import axios from 'axios'

const apiClient = axios.create({
    timeout: 5000,
    headers: {'X-Custom-Header': 'foobar'}
});

apiClient.interceptors.request.use(async config => {
    await new Promise(resolve => setTimeout(resolve, 1));  // TODO KG: remove debug interceptor
    return config;
}, error => {
    return Promise.reject(error);
});

export async function getBudgets(page, searchReq) {
    return apiClient.get(`/api/v1/budgets?page=${page}`)
        .then(resp => resp.data)
        .catch(err => console.log("ERROR: Failed to call for budgets. ", err))
}

export async function getBudgetDetails(id) {
    console.log(`calling for: /api/v1/budgets/${id}`)
    return apiClient.get(`/api/v1/budgets/${id}`)
        .then(resp => resp.data)
        .catch(err => console.log(`ERROR: Failed to call for budget[${id}] details. `, err))
}

export async function getBudgetEvents(id, page) {
    console.log("getBudgetEvents", id, page)
    return apiClient.get(`/api/v1/budgets/${id}/events?page=${page}`)
        .then(resp => resp.data)
        .catch(err => console.log(`ERROR: Failed to call for budget[${id}] events. `, err))
}

export async function updateBudget(id, data) {
    data.type = 'UPDATE'
    return apiClient.put(`/api/v1/budgets/${id}`, data)
        .then(resp => resp.data)
        .catch(err => console.log(`ERROR: Failed to call for budget[${id}] events. `, err))
}