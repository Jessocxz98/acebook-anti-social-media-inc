// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .
// import "../stylesheets/application";
// import '../node_modules/bootstrap/scss/bootstrap.scss';

document.addEventListener('DOMContentLoaded', () => {
  const commentButtons = document.querySelectorAll('.comment-button');
  const commentsCount = document.querySelectorAll('.comments-count');
  const commentForms = document.querySelectorAll('.flex-comment-form');
  const comments = document.querySelectorAll('.comment-box');
  const topComments = document.querySelectorAll('.top-comments');
  const allComments = document.querySelectorAll('.all-comments');
  const showMore = document.querySelectorAll('.show-more');
  const showLess = document.querySelectorAll('.show-less');

  for (let i = 0; i < commentButtons.length; i++) {
    commentButtons[i].addEventListener('click', () => {
      if (commentForms[i].classList.contains('visible')) {
        commentForms[i].classList.remove('visible');
        topComments[i].classList.remove('visible');
      } else {
        commentForms[i].classList.add('visible');
        topComments[i].classList.add('visible');
      }
    });
  }

  for (let i = 0; i < showMore.length; i++) {
    showMore[i].addEventListener('click', () => {
      topComments[i].classList.remove('visible');
      allComments[i].classList.add('visible');
    });
  }

  for (let i = 0; i < showLess.length; i++) {
    showLess[i].addEventListener('click', () => {
      allComments[i].classList.remove('visible');
      topComments[i].classList.add('visible');
    });
  }

  for (let i = 0; i < commentsCount.length; i++) {
    commentsCount[i].addEventListener('click', (event) => {
      if (commentForms[i].classList.contains('visible')) {
        commentForms[i].classList.remove('visible');
        topComments[i].classList.remove('visible');
      } else {
        commentForms[i].classList.add('visible');
        topComments[i].classList.add('visible');
      }
    });
  }
  // .addEventListener('click', () => {
  //   console.log('good');
  // document.getElementById(
  //   `#flex-comment-form-${event.target.id}`
  // ).custom.display = 'block';
  // });
});
