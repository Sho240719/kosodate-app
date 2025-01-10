import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;

function initializeLikes() {
  document.addEventListener('turbo:load', () =>{
    const commentItem = $('#post-comments') // commentItemだとわかりずらいか？？
    const postId = commentItem.data('post-id');

    $('.like-button').on('click', () => {
      axios.post(`/api/posts/${postId}/like`)
      .then((response) => {
        console.log(response.data.status);
      })
      .catch(error => {
        console.error('いいねできませんでした', error);
        alert('いいねできませんでした')
      });
    })
  });
}

// 初期化関数をエキスポート
export default initializeLikes;
