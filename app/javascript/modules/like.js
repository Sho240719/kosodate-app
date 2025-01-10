import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;

function initializeLikes() {
  document.addEventListener('turbo:load', () =>{
    const postId = $('#post-comments').data('post-id');

    $('.like-button').on('click', function() {
      const likeButton = $(this);
      const isLiked = likeButton.data('liked');

      // いいねの状態を取得
      if (isLiked) {
        // いいね済みの場合
        axios.delete(`/api/posts/${postId}/like`)
        .then((response) =>{
          console.log(response.data.status)
        })
        .catch(error => {
          console.error('いいねを取り消せませんでした', error);
          alert('いいねを取り消せませんでした');
        });
      } else {
        // いいねしていない場合
        axios.post(`/api/posts/${postId}/like`)
        .then((response) => {
          console.log(response.data.status);
        })
        .catch(error => {
          console.error('いいねできませんでした', error);
          alert('いいねできませんでした')
        });
      }
    })
  });
}

// 初期化関数をエキスポート
export default initializeLikes;
