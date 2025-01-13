import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;



function initializeFollows() {
  document.addEventListener('turbo:load', () => {

    // フォローする
    $('.button-follow').on ('click', () => {
      const accountId = $('.button-follow').data('account-id');
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

    // アンフォローする
    $('.button-unfollow').on('click', () => {
      const accountId = $('.button-unfollow').data('account-id');
      axios.post(`/api/accounts/${accountId}/unfollows`)
      .then((response) => {
        console.log('アンフォローしました');
        console.log(response.data.status);
      })
      .catch(error => {
        console.error('アンフォローできませんでした', error);
        alert('アンフォローできませんでした');
      });
    })
  })
}

export default initializeFollows;
