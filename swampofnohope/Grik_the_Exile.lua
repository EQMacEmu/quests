function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm busy, " .. e.other:GetCleanName() .. ", go away.");	
	elseif(e.message:findi("mission")) then
		e.self:Say("If you have not noticed the new intelligent races that have found it's way to our land, you will see soon. They have built a small outpost far to the south along the ocean. If they go unchecked, their outpost will become a city from which they will cause us much discomfort. They are strong and have experienced [mercenaries] in their employ.");
	elseif(e.message:findi("mercenaries")) then
		e.self:Say("Yes. In particular, a company of mercenaries commanded by a human known as Streaven. He has personally thwarted an operation I was in charge of. I will make him pay for his interference. You will kill Streaven. But first you must [draw him out], as he is not a fool.");
	elseif(e.message:findi("draw him out")) then
		e.self:Say("While Streaven is not foolish he has made a mistake. He's taken a young and ambitious noble on as an officer in his company. This noble represents a source of funds and as such Streaven most likely will come to his aid if endangered. Our spies have reported that he has been implanted with some sort of device that will alert the commander of any danger. You must retrieve this [implant].");
	elseif(e.message:findi("implant")) then
		e.self:Say("The implant is buried deep within this noble's head. Retrieving it will most likely leave quite a traumatic wound. Once you have the implant you must take it to an agent that will be in the area. This agent is one of the Kotiz Brood, a necromancer. Her name is Vekis and she will be able to activate the implant and draw Streaven out. She will only appear after you have dispatched the noble and she will go back into hiding shortly there after, so you must [find her] quickly.");
	elseif(e.message:findi("find her")) then
		e.self:Say("She will be near one of our ancient statues along the coast. You need only hand her the implant for her to activate it. Once he is away from the guards you will have your chance. Bring me Streaven's Head and 3 rubies and you will have your reference for the Arcut. Remember that your perseverance is your greatest virtue and will carry you to victory always.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I thought I told you to bring me the head of Streaven and 3 rubies. Do not interupt me until you have all that I have asked of you."
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14789})) then
		e.self:Emote("snickers to himself and looks out over the swamp for a moment before saying,");
		e.self:Say("Perseverance is indeed our greatest virtue. Perhaps if we as warriors looked more to cultivate our virtue rather than to hoard glory our people would be rulers of this entire land. I will send you on a [mission] to learn of perseverance. If you complete it I will give you my reference.");
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10035, item2 = 10035, item3 = 10035, item4 = 14819},1,text1)) then
		e.self:Emote("watches as you drop the head onto the soft earth of the swamp. With his foot,Grik tactfully pushes the head off into the water.A sly grin passes over his gace briefly as watches it sink and pockets the rubies. He says, 'Excellent work " .. e.other:Race() .. ". Here is your reference as promissed.'");
		e.other:QuestReward(e.self,0,0,0,0,14816,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
