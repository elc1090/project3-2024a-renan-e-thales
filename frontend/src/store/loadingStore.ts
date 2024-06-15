import { reactive } from 'vue';

const state = reactive({
  isLoading: false
});

const setLoading = (loading: boolean) => {
  state.isLoading = loading;
};

export default {
  state,
  setLoading
};
