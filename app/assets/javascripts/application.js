// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
//= require jquery.turbolinks
// = require jquery_ujs
// = require turbolinks
//= require bootstrap-sprockets
//= require_tree .



// 単語自動ボタン
$(document).on('turbolinks:load', function(){
var autobtn=$('#auto-words');
autobtn.click(function(){
  var englishsentence = $('#englishsentence').val();
  var words = englishsentence.split("");
  var array = $.grep(words, function(e){return e !== "."
    && e !== "-"
    && e !== ","
    && e !== "1"
    && e !== "2"
    && e !== "3"
    && e !== "4"
    && e !== "5"
    && e !== "6"
    && e !== "7"
    && e !== "8"
    && e !== "9"
    && e !== "0"
    && e !== "/"
    && e !== "|"
    && e !== "&"
    && e !== "%"
    && e !== "$"
    ;});
  $.each(array,function(i,word){
    var target = '#sentence_words_attributes_' +i+ '_ch';
    $(target).val(word);
  });
})});
