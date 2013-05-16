// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

$(document).ready(function() {
    $(".preview-image").on("error", function(evt) {
        $(".image-loadingerror-message").text("Couldn't load image, invalid url or host has disabled hotlinking");
    });

    $(".external-image-url-input").focusout(function showPreviewImage(evt){
        if(!$(this).val()) {
            $(".preview-image").removeAttr("src");
            return $(".image-loadingerror-message").text("");
        }
        $(".image-loadingerror-message").text("");
        $(".preview-image").attr("src", $(this).val());
    });
});