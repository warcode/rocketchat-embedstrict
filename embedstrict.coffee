###
# embedstrict embeds stuff
# @param {Object} msg - The message object
###


class Embed
	constructor: (message) ->
		if(message.urls?)
			msg = message.urls[0].url
			picture = msg.match(/^(https:\/\/\S*\.(?:jpe?g|gif|png))$/i)
			webm = msg.match(/^(https:\/\/\S*\.(?:webm|gifv))$/i)
			youtube = msg.match(/^https:\/\/\S*[youtube.com|youtu.be]\/watch\?\S*v=(\w*)\S*$/i)
			imgur = msg.match(/^https:\/\/\S*[imgur.com]\/(\w*)$/i)
			if picture?
				message.html += "<br/><img style='max-width:750px; max-height:525px; width: auto; height: auto;' src='" + picture[0] + "'></img>"
			if webm?
				message.html += "<br/><video style='max-width:750px; max-height:525px; width: auto; height: auto;' src='" + webm[0] + "' loop='' autoplay='' muted=''></video>"
			if youtube?
				message.html += "<br/><iframe src='https://www.youtube.com/embed/"+youtube[1]+"?wmode=transparent&amp;jqoemcache=xd8Cb' width='425' height='349' allowfullscreen='true' allowscriptaccess='always' scrolling='no' frameborder='0' style='max-height: 525px; max-width: 750px; width: 500px; height: 410.588235294118px;''></iframe>"
			if imgur?
				message.html += "<br/><img style='max-width:750px; max-height:525px; width: auto; height: auto;' src='https://i.imgur.com/" + imgur[1] + ".png'></img>"
		return message

RocketChat.callbacks.add 'renderMessage', Embed, RocketChat.callbacks.priority.LOW
