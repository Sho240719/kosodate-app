import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;

// フォロー状態によってボタンの表示を切り替え
function toggleFollowsDisplay(hasFollow) {
  if (hasFollow === 'followed') {
    $('.button-follow').addClass('hidden');
    $('.button-unfollow').removeClass('hidden');
  } else {
    $('.button-unfollow').addClass('hidden');
    $('.button-follow').removeClass('hidden');
  }
}

// フォローされた、外されたときにフォロワー数を変更して表示する関数
function changeFollowCount (accountId) {
  const followerCount = $(".follower-count");
  axios.get(`/accounts/${accountId}/followers`)
  .then((response) => {
    console.log(response.data.follower_count);
    followerCount.text(`${response.data.follower_count}`);
  })
  .catch(error => {
    console.error('フォロワーカウントを更新できませんでした', error);
    alert('フォロワーカウントを更新できませんでした');
  });
}


document.addEventListener('turbo:load', () => {
  // フォローする
  $('.button-follow').on ('click', () => {
    const accountId = $('.button-follow').data('account-id');
    axios.post(`/api/accounts/${accountId}/follows`)
    .then((response) => {
      toggleFollowsDisplay(response.data.status)
      changeFollowCount (accountId)
    })
    .catch(error => {
      console.error('フォローできませんでした', error);
      alert('フォローできませんでした');
    });
  });

  // アンフォローする
  $('.button-unfollow').on('click', () => {
    const accountId = $('.button-unfollow').data('account-id');
    axios.post(`/api/accounts/${accountId}/unfollows`)
    .then((response) => {
      toggleFollowsDisplay(response.data.status)
      changeFollowCount (accountId)
    })
    .catch(error => {
      console.error('アンフォローできませんでした', error);
      alert('アンフォローできませんでした');
    });
  });
});
