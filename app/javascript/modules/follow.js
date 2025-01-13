import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;



function initializeFollows() {
  document.addEventListener('turbo:load', () => {
    // accountIdを取得
    const accountId = $('.button-follow').data('account-id');

    // フォローする
    $('.button-follow').on ('click', () => {
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
