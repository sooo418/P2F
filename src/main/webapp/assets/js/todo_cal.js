// 날짜교체 - 클릭시 해당 메소드 호출
function onchangeDay(yyyy, mm, dd, ss) {
	$("#nows").html(yyyy + mm + dd);
	var cal = $('#nows').text();
	var url = "todo/cal.do?tododate=" + cal;
	window.location.href = url;
}

$(document).ready(
		function() {
			var currentLangCode = 'ko';

			// build the language selector's options
			$.each($.fullCalendar.langs, function(langCode) {
				$('#lang-selector').append(
						$('<option/>').attr('value', langCode).prop('selected',
								langCode == currentLangCode).text(langCode));
			});

			// rerender the calendar when the selected option changes
			$('#lang-selector').on('change', function() {
				if (this.value) {
					currentLangCode = this.value;
					$('#calendar').fullCalendar('destroy');
					renderCalendar();
				}
			});

			function renderCalendar() {
				$('#calendar').fullCalendar({
					header : {
						left : 'prev,next today',
						center : 'title',
						right : ''
					},
					defaultDate : new Date,
					lang : currentLangCode,
					buttonIcons : false, // show the prev/next text
					editable : true,
					dayClick : function(date, allDay, jsEvent, view) {
						var yy = date.format("YYYY");
						var mm = date.format("MM");
						var dd = date.format("DD");
						var ss = date.format("dd");
						onchangeDay(yy, mm, dd, ss);
					},
					eventClick : function(calEvent, jsEvent, view) {
						return false;
					},
					eventLimit : true, // allow "more" link when too many
				// events
				});
			}

			renderCalendar();
		});
function Logout() {
	f1.action = "logout.do"
	f1.submit();
}
$(document).ready(function() {
	var td = $('.todopriority');
	var tc = $('.todopri');
	var tcon = $('.todocon');
	td.each(function(index) {
		var todocontent = tcon.eq(index).text();
		if (todocontent.length >= 7) {
			tcon.eq(index).text(todocontent.substr(0, 4) + '..');
		}
		var todopriority = td.eq(index).html();
		if (todopriority == 1) {
			tc.eq(index).text("◆◆◆");
			tc.eq(index).css("color", "#ff0000");
		}
		if (todopriority == 2) {
			tc.eq(index).text("◆◆");
			tc.eq(index).css("color", "#ff1a75");
		}
		if (todopriority == 3) {
			tc.eq(index).css("color", "#ff9966");
		}
	})
})