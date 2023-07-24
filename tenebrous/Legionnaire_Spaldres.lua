function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks you over observantly. 'Welcome to Katta Castellum. Don't be causing any trouble whilst visiting our grand city or you may end up on the receiving end of a Validus Custodus blade.");
	end
end
