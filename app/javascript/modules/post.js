import $ from 'jquery';

document.addEventListener('turbo:load', () => {
  const contentInput = $('.post-form-textarea'); // 文字を入力するエリア
  const maxLength = contentInput.attr('maxlength');// 入力可能な最大文字数を取得
  const charCount = $('#char-count'); // 文字数を表示するエリア

  if (contentInput.length && charCount.length) {
    // 入力した文字数を表示
    contentInput.on('input', function () {
      const currentLength = $(this).val().length;
      charCount.text(`${currentLength} / ${maxLength}`);

      // 文字数が上限を超えたら文字色を赤くする
      if (currentLength > maxLength) {
        charCount.css('color', 'red');
      } else {
        charCount.css('color', 'black');
      }
    });
  }
});
