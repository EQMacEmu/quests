function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("is covered with flour.  She reaches out to shake your hand.  'Pleased to meet you.  Ooops!!  Teehee!!  I have gotten flour on your hand.  Please forgive me.  I have been quite busy baking bread for the soldiers - even that braggart, Treekill.  Look around.  I even have a few items shipped from the Faydwer.'");
		e.self:DoAnim(54);
	elseif(e.message:findi("treekill")) then
		e.self:Emote("turns angry. TreeKill!! I do not want to see nor hear of him. He is always trying to impress me!! I finally told him that I would walk with him if he could bake a Burynai Bundt Cake.");	
		e.self:DoAnim(30);
	elseif(e.message:findi("burynai bundt cake")) then
		e.self:Say("Burynai bundt cake?  There is no such thing.");	
		e.self:DoAnim(54);
	end
end