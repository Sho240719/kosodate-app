// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import $ from 'jquery';

document.addEventListener("DOMContentLoaded", () => {
  console.log("jQuery is working!");

  $('h1').on('click', () => {
    window.alert('Hello!');
  })
});
