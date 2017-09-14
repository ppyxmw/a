/*global $*/

function toggleFunction(item) {
  var mealphoto = document.getElementById("mealphoto" + item);
  var chefphoto = document.getElementById("chefphoto" + item);
  var mealdescription = document.getElementById("mealdescription" + item);
  var chefdescription = document.getElementById("chefdescription" + item);
  var backtomeal = document.getElementById("backtomeal" + item);
  var chefname = document.getElementById("chefname" + item);
    
  if (mealphoto.style.display === 'none') {
      mealphoto.style.display = 'block';
      chefphoto.style.display = 'none';
      mealdescription.style.display = 'block';
      chefdescription.style.display = 'none';
      backtomeal.style.display = 'none';
      chefname.style.display = 'block';
  } else {
      mealphoto.style.display = 'none';
      chefphoto.style.display = 'block';
      mealdescription.style.display = 'none';
      chefdescription.style.display = 'block';
      backtomeal.style.display = 'block';
      chefname.style.display = 'none';
  }
}

function likeFunction(id){  
  // var meal = document.getElementById("liked_" + id);
  var button = document.getElementById("like_" + id);
  // var link2 = document.getElementById("like2_" + id);
  var on = document.getElementById("on_" + id);
  var off = document.getElementById("off_" + id);
  var repeat = "likeFunction(" + id + ")"
  // if (meal.outerHTML[21] == "l"){   
        // document.getElementById(id).click()
    $(".switch").css("cursor", "wait");
    $(".slider").css("cursor", "wait");
    $("body").css("cursor", "wait");
    $(off).attr("onclick", "");
    $(on).attr("onclick", "");
    $(button).click();
    // $.post(path);

    
    
    // $.ajax({
    //   type: "POST",
    //   url: "/unlike?meal_id=" + id,
    //   beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},    });
  // } else {
    // $(".switch").css("cursor", "wait");
    // $(".slider").css("cursor", "wait");
    // $("body").css("cursor", "wait");
    // $(link2).click()
    // $.ajax({
    //   type: "POST",
    //   url: "/like?meal_id=" + id,
    //   beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},    });
  // }; 
};
