import axios from 'axios'

const apiClient = axios.create({
    timeout: 5000,
    headers: {'X-Custom-Header': 'foobar'}
});

apiClient.interceptors.request.use(async config => {
    await new Promise(resolve => setTimeout(resolve, 1000));
    return config;
}, error => {
    return Promise.reject(error);
});

export async function getBudgets(page) {
    console.log("getBudgets!")
    return apiClient.get(`/api/v1/budgets?page=${page}`)
        .then(resp => resp.data)
        .catch(err => console.log("ERROR: Failed to call for budgets. ", err))
}


export async function getBudgets3(page) {
    const response = await fetch(`/api/v1/budgets?page=${page}`)
    console.log("1", response, response.ok);
    if (!response.ok) {
        console.log("1.1");
        let result = await response.text()
        console.log("Error!", result)
        throw new Error(`Error: ${response.status} ${response.statusText}`);
    } else {
        console.log("dbg")
    }
    let json = await response.json()
    console.log("1.2", json);
    return json;
}

export async function getBudgets2(page) {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve("hello");
        }, 2000);
    });
}