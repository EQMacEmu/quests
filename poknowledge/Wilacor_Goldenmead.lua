function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:DoAnim(29);
		e.self:Say("Greetings. traveler! I am Wilacor Goldenmead. resident of this most fair of cities and baking is my trade. I know that the worlds beyond this place are treacherous indeed. and one needs their strength to withstand the dangers that they most certainly face. The supplies that I provide are ideal for all adventurers and will keep the most hardy of warriors strong and well-nourished so that they may be at their best when battle is nigh. Come. search my wares and purchase as you will!");
	end
end
