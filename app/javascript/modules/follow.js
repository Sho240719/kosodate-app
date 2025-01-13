import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;



function initializeFollows() {
  document.addEventListener('turbo:load', () => {
    // accountIdを取得
    const accountId = $('.follow-button').data('account-id');

    $('.follow-button').on ('click', () => {
      axios.post(`/api/accounts/${accountId}/follows`)
      .then((response) => {
        console.log('フォローできました');
        console.log(response.data.status);
      })
      .catch(error => {
        console.error('フォローできませんでした', error);
        alert('フォローできませんでした');
      });
    })
  })
}

export default initializeFollows;
