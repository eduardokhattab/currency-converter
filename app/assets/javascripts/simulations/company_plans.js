$(document).ready(function() {
  $("#myCarousel").on("slide.bs.carousel", function(e) {
    var $e = $(e.relatedTarget);
    var idx = $e.index();
    var itemsPerSlide = 3;
    var totalItems = $(".carousel-item").length;

    if (idx >= totalItems - (itemsPerSlide - 1)) {
      var it = itemsPerSlide - (totalItems - idx);
      for (var i = 0; i < it; i++) {
        // append slides to end
        if (e.direction == "left") {
          $(".carousel-item")
            .eq(i)
            .appendTo(".carousel-inner");
        } else {
          $(".carousel-item")
            .eq(0)
            .appendTo($(this).find(".carousel-inner"));
        }
      }
    }
  });

  $(".card").on("click", function(el) {
    var cards = Array.prototype.map.call($(".cards").children(), function(card) {
      if (card !== this) {
        $("#"+card.id).addClass("clicked");
        setTimeout(function(){ $("#"+card.id).removeClass("clicked"); }, 400);
      }
      return card.className
    })
  });
});
