// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//

window.AOI = window.AOI || {};
jQuery(function () {
    AOI.admin.initialize();
});

// Admin related functions
AOI.admin = (function($) {
    var that = {};

    that.initialize = function() {
        editQuestion();
    };

    function editQuestion() {
        $(document).bind('reveal.facebox', function() {
            if ($('#facebox .edit-question').length > 0) {
                $('#facebox .new_idea_field').jqEasyCounter({target: '#facebox .new_idea_counter', maxChars : 255, maxCharsWarning: 245});
            }
        });
        $('.edit-question .new_idea_submit').live('click', function(ev) {
            var form = $(ev.target).closest('form');
            form.ajaxSubmit({
                dataType : 'json',
                success : function(rt, st, xhr) {
                    form.find('textarea').val('');

                    if (rt.status === 'success') {
                        $('.question-name').text(rt.question.name);
                        $.facebox({div: '#question-saved'});
                    }
                    else {
                        $.facebox({div: '#cant-edit-question'});
                    }
                }
            });
        });
    }

    return that;
}(jQuery));


function validate_idea_form() //mark for deletion
{
	var errors = [];
	var name = $('#question_name').val();
	var url = $('#question_url').val();
	var new_ideas = $('#question_question_ideas').val();
	alert(new_ideas);
	if ((new_ideas === "Add your own ideas here...&#x000A;&#x000A;For example:&#x000A;More hammocks on campus&#x000A;Improve student advising&#x000A;More outdoor tables and benches&#x000A;Video game tournaments&#x000A;Start late dinner at 8PM&#x000A;Lower textbook prices&#x000A;Bring back parking for sophomores") || (new_ideas === '')) {
		event.returnValue = false;
		errors[errors.length] = 'Blank ideas are not allowed.';
	}
	if ((name === 'Add your own idea here...') || (name === '')) {
		event.returnValue = false;
		errors[errors.length] = 'Blank question names are not allowed.';
	}
	
	if ((url === 'Add your own idea here...') || (url === '')) {
		event.returnValue = false;
		errors[errors.length] = 'Blank question urls are not allowed.';
	}
	return errors;
}

function sleep(ms)
{
	var dt = new Date();
	dt.setTime(dt.getTime() + ms);
	while (new Date().getTime() < dt.getTime()) {
        1+1;
    }
}

function increment(number)
{
	return parseInt(number, 10) + 1;
}
function decrement(number)
{
	return parseInt(number, 10) - 1;
}
function iframe_loaded(){
	   $('.voter_map_indicator').hide();
}


jQuery(document).ready(function() {
	
	//$('label').labelOver('over-apply');
	
	
  $(".votebox tr.prompt td.idea").each(function(el) {
    $(this).bind("click", function() {
      $([$(this).children(".round-filledfg"), $(this).children(".round-filled").children()]).each(function(el) {
        $(this).css("background", "#0B0");
        $(this).css("border-left", "1px solid #0B0");
        $(this).css("border-right", "1px solid #0B0");

				//setTimeout("alert ('called from setTimeout()');",4000)
//				sleep(1000);

        // $(this).css("background", "#3198c1");
        // $(this).css("border-left", "1px solid #3198c1");
        // $(this).css("border-right", "1px solid #3198c1");
      });
      // $(this).unbind("mouseover")
      // $(this).unbind("mouseout")
    });
    $(this).bind("mouseover", function() {
      $([$(this).children(".round-filledfg"), $(this).children(".round-filled").children()]).each(function(el) {
        $(this).css("background", "#2b88ad");
        $(this).css("border-left", "1px solid #2b88ad");
        $(this).css("border-right", "1px solid #2b88ad");
      });
    });
    $(this).bind("mouseout", function() {
      $([$(this).children(".round-filledfg"), $(this).children(".round-filled").children()]).each(function(el) {
        $(this).css("background", "#3198c1");
        $(this).css("border-left", "1px solid #3198c1");
        $(this).css("border-right", "1px solid #3198c1");
      });
    });});

	$('.toggle_question_status').bind('click',function(ev){
		$.blockUI({ message: null, fadeIn: 0, fadeOut:  0, overlayCSS:  { 
		        backgroundColor: '#000', 
		        opacity:   0.0
		}});
        // should use .data() when we upgrade jQuery
		var earl_id = $(ev.target).attr("data-earl_id");
        var postData  = {authenticity_token: AUTH_TOKEN };
		$.post('/questions/' + earl_id + '/toggle.js', postData,
		    function(data){
			    $.unblockUI();
                if(!data['error']) { 
                    $(ev.target).html(data['verb']);

                    if (data['verb'] == "Activated") {
                        $(ev.target).addClass('btn-primary');
                    }
                    else {
                        $(ev.target).removeClass('btn-primary');
                    }
                }
            },
		    "json"
		);
		return false;
	});
	
	$('.toggle_choice_status').bind('click',function(ev){
		$('.indicator').show();
		$.blockUI({ message: null, fadeIn: 0, fadeOut:  0, overlayCSS:  { 
		        backgroundColor: '#000', 
		        opacity:         0.0
		    }});
        var button = $(ev.target);
		var choice_id = button.attr("data-choice_id");
		var earl_id = button.attr("data-earl_id");
		var state = button.attr("data-status");
		$.post('/questions/' + earl_id + '/choices/' + choice_id + '/toggle.js',
		{authenticity_token: AUTH_TOKEN },
		function(data) {
			$('.indicator').hide();
			$.unblockUI();
			//humanMsg.displayMsg(data['message']);
			if(!data['error']) { 
            if (data['active'] === true) {
                button.attr("data-status", true);
                button.addClass('btn-primary');
            }
            else if (data['active'] === false) {
                button.attr("data-status", false);
                button.removeClass('btn-primary');
            }
            button.html(data['verb']);
		}
			//$('.prompter').effect("highlight", {}, 1500);
			
		},
		"json"
		);
		return false;
	});
	
	
	$('.toggle_autoactivate_status').bind('click',function(event){
		$('.indicator').show();
		$.blockUI({ message: null, fadeIn: 0, fadeOut:  0, overlayCSS:  { 
		        backgroundColor: '#000', 
		        opacity:         0.0
		    }});
        var button = $(event.target);
		var question_id = button.attr("data-question_id");
		var state = button.attr("data-status");
		$.post('/questions/' + question_id + '/toggle_autoactivate.js', {authenticity_token: AUTH_TOKEN }, function(data){
            $('.indicator').hide();
            $.unblockUI();
            if(!data['error']) {
                button.toggleClass('btn-primary');
                button.html(data['verb']);
		    }
		}, "json");
		return false;
	});
	
	$('input[title!=""]').hint();
	$('textarea[title!=""]').hint();
	
	
/*
	$('#view_voter_map').bind('click',function(event){		
			event.preventDefault();
			event.stopPropagation();

			var link= $('#view_voter_map');
			var target = link.attr('iframe_url');

			var voter_map_row = $('#voter_map_row')
			
			var theText = (link.text() == "[View]") ? "[Close]" : "[View]";
			link.text(theText);

			if(voter_map_row.length>0)
			{
			   if($('#voter_map_row:hidden').length>0){
			       $('#voter_map_row:hidden').show()
			   }
			   else{
			       $('#voter_map_row').hide();
			   }

			}
				
			else{
			  var iframe_html= "<tr id=voter_map_row class='row1' style='display:none'><td class='title' colspan='2' style='text-align:center'><iframe src='" + target + "' width='722px' height='380px'frameborder=0 scrolling=no style='border:1px solid rgb(145,145,145);'></iframe></td></tr>";
			  $('#view_voter_map_row').after(iframe_html);
			
			  $('#voter_map_row:hidden').show();

			}


			});
	*/

        $('.view_voter_map').click(function(event){
			event.preventDefault();
			event.stopPropagation();
			
			var current_row = $(this).parent().parent();
			var target_row = $(this).parent().parent().next();
			if(!toggleLinkTextandTargetElement($(this), target_row))
			{
			        var iframe_html= "<tr id=voter_map_row class='row1'><td class='title' colspan='2' height=370px><div class='voter_map_indicator'><img src='/images/indicator.gif' /></div><iframe id='voter_map_iframe' src='" + $(this).attr('href') + "' onload='iframe_loaded();' width='746px' height='370px' frameborder=0 scrolling=no style='border:1px solid rgb(145,145,145);'></iframe></td></tr>";
				current_row.after(iframe_html);
//				$('#view_voter_map_row').after("<tr id=voter_map_row class='row1'><td class='title' height=360px colspan='2' style='text-align:center'><div id='geo_map_canvas'><img src=/images/indicator.gif /></div></td></tr>")
//				$.get($(this).attr("href")+".js", null, null, "script");
				$(this).attr('isLoaded', true);
			}
	});
	
	function toggleLinkTextandTargetElement(link, target){
			//Using functions here to allow for i8n
			var theText = (link.text() == results_view_text()) ? results_close_text() : results_view_text();
			link.text(theText);

			var loaded = link.attr('isLoaded');
			if(loaded)
			{
				if(theText == results_view_text()){
				  target.hide();
				}
				else{
				  target.show();
				}
				return true;

			}
			else{
				//this hasn't been initialized, punt
				return false;
			}
	}

    $('.date-chart').click(function(event){
        event.preventDefault();
        event.stopPropagation();

        var target_row = $(this).parent().parent().next();
        var target_div = $(this).parent().parent().next().find('div');
        if(!toggleLinkTextandTargetElement($(this), target_row))
        {
            target_row.show();
            target_div.html('<img src=/images/indicator.gif />');
            $.get($(this).attr("href"), null, null, "script");
            $(this).attr('isLoaded', true);

        }
    });
});

