import axios from 'axios';
import loadingStore from '../store/loadingStore';

const apiClient = axios.create({
  baseURL: 'https://project3-2024a-renan-e-thales.vercel.app/',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }
});

apiClient.interceptors.request.use(config => {
  loadingStore.setLoading(true);
  return config;
}, error => {
  loadingStore.setLoading(false);
  return Promise.reject(error);
});

apiClient.interceptors.response.use(response => {
  loadingStore.setLoading(false);
  return response;
}, error => {
  loadingStore.setLoading(false);
  return Promise.reject(error);
});

export default apiClient;
