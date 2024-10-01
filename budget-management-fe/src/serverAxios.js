import axios from "axios";

const axiosConfig = {
    timeout: 5000,
    headers: {'X-Custom-Header': 'foobar'}
}

const apiClient = axios.create(axiosConfig);

// apiClient.interceptors.request.use(async config => {
//     await new Promise(resolve => setTimeout(resolve, 1));  // TODO KG: remove debug interceptor
//     return config;
// }, error => {
//     return Promise.reject(error);
// });

export const retryClient = axios.create(axiosConfig);
export default apiClient;