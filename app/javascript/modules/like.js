import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;

// いいね表示の切り替え
function toggleLikesDisplay(hasLiked) {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden');
    $('.inactive-heart').addClass('hidden');
  } else {
    $('.inactive-heart').removeClass('hidden');
    $('.active-heart').addClass('hidden');
  }
}

function initializeLikes() {
  document.addEventListener('turbo:load', () =>{
    const postCommentsElement = $('#post-comments');
    if (postCommentsElement.length === 0) return;

    const postId = $('#post-comments').data('post-id');

    // いいね状態を取得、表示
    axios.get(`/api/posts/${postId}/like`)
      .then((response) => {
        toggleLikesDisplay(response.data.hasLiked)
      })
      .catch(error => {
        console.error('いいね状態を取得できませんでした', error)
      });

    // いいねする
    $('.inactive-heart').on('click', () => {
      axios.post(`/api/posts/${postId}/like`)
        .then((response) =>{
          toggleLikesDisplay(response.data.status)
        })
        .catch(error => {
          console.error('いいねできませんでした', error);
          alert('いいねできませんでした')
        });
    })

    // いいねをはずす
    $('.active-heart').on('click', () => {
      axios.delete(`/api/posts/${postId}/like`)
        .then((response) =>{
          toggleLikesDisplay(response.data.status)
        })
        .catch(error => {
          console.error('いいねを取り消せませんでした', error);
          alert('いいねを取り消せませんでした');
        });
    })
  });
}

// 初期化関数をエキスポート
export default initializeLikes;
