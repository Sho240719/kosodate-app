// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import $ from 'jquery';
import axios from "axios";

// AxiosにCSRFトークンを設定
const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;

document.addEventListener("turbo:load", () => {
  // `data-post-id`からpostIdを取得
  const commentsElement = $("#post-comments");
  if (commentsElement.length > 0) {
    const postId = commentsElement.data("post-id");

    // コメント一覧を表示
    axios.get(`/api/posts/${postId}/comments`)
    .then(response => {
      const comments = response.data
      comments.forEach ((comment) => {
        const avatarImageUrl = comment.user.profile.avatar_image_url;
        const nickname = comment.user.profile.nickname;

        $('.comments-section').append(`
          <div class="comment-item">
            <div class="comment-header">
              <div class="comment-user-info">
                <img src="${avatarImageUrl}" class="comment-avatar-icon">
                <p class="nickname">${nickname}</p>
              </div>
              <span class="comment-timestamp">${comment.created_at}</span>
            </div>
            <div class="comment-content">
              <p>${comment.content}</p>
            </div>
          </div>
        `);
      });
    })
    .catch(error => {
      console.error("コメントの取得に失敗しました:", error);
    });
  }



  // コメントフォームを表示
  $('.show-comment-button').on('click',function() {
    $(this).addClass('hidden');
    $('.comment-form-textarea').removeClass('hidden');
  })

  // コメント追加時にフォームを非表示
  $('.add-comment-button').on('click',() => {
    $('.comment-form-textarea').addClass('hidden');
    $('.show-comment-button').removeClass('hidden');
  })
});
