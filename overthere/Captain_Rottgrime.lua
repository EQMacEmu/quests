function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("has numerous cracks and holes in his skull from many battles. 'Attention, marine!! You will go into battle and fear nothing! You shall prevail over one enemy and then you shall be sent back into battle! We [shall not allow those sarnak to overtake the Danak shipyards]! Is that clear marine?!!'");
	elseif(e.message:findi("shall not allow those sarnak to overtake the danak shipyards")) then
		e.self:Say("Stand up straight!! That is correct marine!! YOU shall not allow the sarnak to overtake the shipyards!! Head out to the frontlines, marine!! Kill the berzerkers and return their war braids to me!! For every four, you shall earn your wages!! Now get to the front, marine!! Move it!! Move it!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Keep up the good work, marine.";		
	
	--Handin: 4x a Sarnak War Braid (12982)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12982, item2 = 12982, item3 = 12982, item4 = 12982},1,text)) then
		e.self:Say("Great job marine!! Word of your heroics shall be passed on to the Admiral. If you don't have a shield then take one, if you do then get back to the frontlines. There is no time for R n R!! Move it marine!! Or you'll be pushing Danak till the cockatrice crow!!");
		e.other:Faction(e.self,318,8); -- +Venril Sathir
		e.other:QuestReward(e.self,0,0,math.random(1,4),0,12981,10); --Guard of the Marines
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp==2) then
		e.self:Say("Atteeennntion !!");
		eq.signal(93126);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
