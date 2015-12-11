$(".story-info-panel").html("<%= escape_javascript(render("story_indiv")) %>")

$(".story-info-panel").show()
$(".info-story-loading").hide()
