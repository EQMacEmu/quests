function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("is covered with flour.  She reaches out to shake your hand.  'Pleased to meet you.  Ooops!!  Teehee!!  I have gotten flour on your hand.  Please forgive me.  I have been quite busy baking bread for the soldiers - even that braggart, Treekill.  Look around.  I even have a few items shipped from the Faydwer.'");
		e.self:DoAnim(54);
	end
end