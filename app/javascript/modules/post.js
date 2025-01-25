import $ from 'jquery';

document.addEventListener('turbo:load', () => {
  const $contentInput = $('.post-form .post-form-textarea'); // 入力エリア
  const $charCount = $('.post-form #char-count'); // 文字数を表示するエリア
  const maxLength = $contentInput.attr('maxlength'); // 入力可能な最大文字数を取得

  if ($contentInput.length && $charCount.length) {
    // 入力イベントを監視
    $contentInput.on('input', function () {
      const currentLength = $(this).val().length; // 現在の文字数を取得
      $charCount.text(`${currentLength} / ${maxLength}`); // 文字数を更新

      // 文字数が上限を超えたら文字色を赤くする
      if (currentLength > maxLength) {
        $charCount.css('color', 'red');
      } else {
        $charCount.css('color', 'black');
      }
    });
  }
});
