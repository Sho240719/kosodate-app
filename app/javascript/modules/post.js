function initializePosts() {
  document.addEventListener('turbo:visit', (event) => {
    const url = new URL(event.detail.url);
    // URLパスが`/posts`である場合にリロード
    if (url.pathname === '/posts') {
      window.location.reload();
    }
  });
}

// 初期化関数をエキスポート
export default initializePosts;
