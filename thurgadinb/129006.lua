function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yer not the first to come thru here ye know. O'er the years there have been a few who escaped a death in the pit and left thru the Tizmak caves below. It is to make up for my disgrace that I choose to stay.");
	elseif(e.message:findi("tizmak")) then
		e.self:Say("The Tizmak are a race of Yakmen that live in the caves below us. They're not the brightest lot but they have been good to us over the years. We have a nice little deal with them really, they bring us food and supplies and in exchange we make weapons and arms for them. They are a peaceful people unless provoked, but have proven themselves a useful ally against the Kromrif. It is in this secret manner that we may still serve our people and the will of Brell.");
	end
end
