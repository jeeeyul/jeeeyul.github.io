function getURLParameter(name, fallback) {
	return decodeURI((RegExp(name + '=' + '(.+?)(&|$)').exec(location.search) || [ , fallback ])[1]);
}

$(function() {
	$dialog = $("#update-site-dialog");
	var nameHTML = _.template('<input class="text-field" value="<%=name%>">')({
		name : getURLParameter("name", "Jeeeyul's Eclipse Update Site")
	});
	var $nameField = $(nameHTML);

	$nameField.appendTo(document.body);

	var urlHTML = _.template('<input class="text-field" value="<%=url%>">')({
		url : getURLParameter("url", "http://eclipse.jeeeyul.net/update")
	});
	var $urlField = $(urlHTML);

	$urlField.appendTo(document.body);

	$(".text-field").on("focus", function(e) {
		var me = this;
		setTimeout(function() {
			me.select();
			me = null;
		});
	});

	$("img").on("load", function(e) {
		$nameField.css({
			left : $dialog.position().left + 122,
			top : $dialog.position().top + 73,
			width : 300
		});
		$urlField.css({
			left : $dialog.position().left + 122,
			top : $dialog.position().top + 107,
			width : 300
		});
	});
});