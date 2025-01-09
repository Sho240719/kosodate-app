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
      const comments = response.data.comments
      comments.forEach ((comment) => {
        const avatarImageUrl = comment.user.profile.avatar_image_url;
        const nickname = comment.user.profile.nickname;

        $('.comments-section').append(`
          <div class="comment-item" data-comment-id="${comment.id}">
            ${comment.is_own_comment ? `<span class="delete">削除</span>` : ""}
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


    // コメントを追加
    $('.add-comment-button').on('click', () => {
      const content = $('.comment-textarea').val();
      axios.post(`/api/posts/${postId}/comments`, {
        comment: { content: content }
      })
      .then((response) => {
        const comment = response.data.comment;
        const avatarImageUrl = comment.user.profile.avatar_image_url;
        const nickname = comment.user.profile.nickname;

        $('.comments-section').append(`
          <div class="comment-item" data-comment-id="${comment.id}">
            ${comment.is_own_comment ? `<span class="delete">削除</span>` : ""}
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
        // コメント追加時にフォームを空にして非表示
        $('.comment-textarea').val('');
        $('.comment-form-textarea').addClass('hidden');
        $('.show-comment-button').removeClass('hidden');
      });
    })


    // コメントを削除
    $('.comments-section').on('click', '.delete', function() {
      const commentItem = $(this).closest('.comment-item');
      const commentId = commentItem.data('comment-id');

      if (confirm('コメントを削除しますか？')) {
          axios.delete(`/api/posts/${postId}/comments/${commentId}`)
          .then(() => {
            commentItem.remove();
          });
      } else {
        window.alert('削除をキャンセルしました')
      }
    });
  }


  // コメントフォームを表示
  $('.show-comment-button').on('click',function() {
    $(this).addClass('hidden');
    $('.comment-form-textarea').removeClass('hidden');
  })
});
