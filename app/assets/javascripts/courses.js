$(document).ready(function() {
  function fetchMeetup(url) {
    var url = url.split('/');
    if (url[url.length-1] === "") {
      var id = url[url.length-2];
    }
    else {
      var id = url[url.length-2];
    }
    var api_key = "50126113187c612be767a33451ac";
    $.ajax({
      url: 'https://api.meetup.com/2/event/' + id + '?key=' + api_key + '&sign=true',
      crossDomain: true,
      dataType: 'jsonp',
      type: "GET",
      success: function dataSuccess(data) {
        populateForm(data);
        },
      error: function(data) {
        console.log("OH NOEEESSS! SOMETHING WENT WRONG!", data);
      }
    });
  }

  function populateForm(data, url) {
    console.log(data);
    $('div.loading').remove();
    $('form.new_course').show();
    $('#course_name').val(data.name);
    $('#course_description').val(data.description);
    $('#course_url').val(data.event_url);
    $('#course_location').val(data.venue.name + ' ' + data.venue.address_1);
    var year = $('#course_date_1i'); // YYYY
    var month = $('#course_date_2i'); // January
    var day = $('#course_date_3i'); // 1-31
    var hour = $('#course_time_4i'); // 00-23
    var minute = $('#course_time_5i'); // 00-59
  }

  function loadingThingy() {
    $('body').append('<div class="loading"><h1>Loading!</h1></div>');
  }

  $('form.new_course').hide();
  $('form.fetch_meetup').submit(function(event) {
    event.preventDefault();
    var url = $('form.fetch_meetup input#url').val();
    $('form.fetch_meetup').hide();
    loadingThingy();
    fetchMeetup(url);
  });
});

// $(document).ready(function(){
//   if ($('div#events')) {
//     getMeetups();
//   }
// });

// function getMeetups(){
//   var api_key = "50126113187c612be767a33451ac";
//   $.ajax({
//     url: 'https://api.meetup.com/2/events?key='+api_key+'&sign=true&group_urlname=Girl-Develop-It-Chicago-IL&page=20',
//     crossDomain: true,
//     dataType: 'jsonp',
//     type: "GET",
//     success: function dataSuccess(data) {
//       parseMeetups(data.results);
//       },
//     error: function(data) {
//       console.log("OH NOEEESSS! SOMETHING WENT WRONG!", data);
//     }
//   });
// }

// function dateFromSecondsSinceEpoch(secs) {
//   var date = new Date(0);
//   date.setUTCMilliseconds(secs);
//   return date;
// }

// function prettyMonth(num) {
//   var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
//   return months[num];
// }

// function formatTime(date) {
//   // Hour and AM or PM
//   if (date.getHours() > 12) {
//     var hour = date.getHours() - 12;
//     var period = "p.m.";
//   }
//   else {
//     var hour = date.getHours();
//     var period = "a.m.";
//   }

//   // Format minutes properly
//   if (date.getMinutes() < 10) {
//     var minutes = '0' + date.getMinutes();
//   }
//   else {
//     var minutes = date.getMinutes ()
//   }

//   var time = hour + ":" + minutes + " " + period;
//   return time;
// }

// function parseMeetups(data) {
//   for (var i = data.length - 1; i >= 0; i--) {

//     // Date and time of event
//     var date = dateFromSecondsSinceEpoch(data[i].time);
//     var month = prettyMonth(date.getMonth());
//     var time = formatTime(date);
//     var day = date.getDate();
//     var formatDate = month + ' ' + day + ', 2014 at ' + time;

//     var fee = data[i].fee;
//     var name = data[i].name;
//     var desc = data[i].description;
//     var url = data[i].event_url;
//     var yes = data[i].yes_rsvp_count;
//     var venue = data[i].venue.name;
//     var address = data[i].venue.address_1 + "<br>Chicago, IL<br>" + data[i].venue.zip;

//     var header = "<div class='pure-g'><div class='pure-u-1'><h2 class='center'><a href='" + url + "'>" + name + "</a></h2></div></div>";
//     var rsvp = "<div class='pure-g'><div class='pure-u-1-5'><p><a class='button-pink' href='" + url + "'>RSVP now!</a><br><br><br>";
//     var attending = "<span class='button-green'>" + yes + " Attending</span>";
//     var location = "<br><br><br><strong>Location:</strong><br><span class='small'>" + venue + "</strong><br>" + address + "</span></p></div>";
//     var date = "<div class='pure-u-4-5'><h3>" + formatDate + "</h3>";
//     var description = desc + "</div></div>";
//     var divider = "<div class='hr'>&nbsp;</div>";

//     $('div#events').append(header + rsvp + attending + location + date + description + divider);
//   };
// }