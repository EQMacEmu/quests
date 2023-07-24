--Cook Yalkiin Quests
--Beetle Claw Stew
--Worm Meat Broth
--Vegetables
--Also turn in for Taruun Apprentice quest
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to our kitchen! As you can tell we stay pretty busy in here.  There are a lot of people to feed and a vast number of delicious meals to feed them.  I'm in charge of preparing [stews], [broth], and [vegetables].  If you ever have any questions about those areas. please let me know.");
	elseif(e.message:findi("vegetables")) then
		e.self:Say("I could go on forever about vegetables. There is such a huge variety to choose from and so much that you can do with... well... come back a bit later and we can talk about them in greater detail.");
	elseif(e.message:findi("stews")) then
		e.self:Say("Stews are a staple in this kitchen. When a cook can't think of a real meal or needs to feed a large number of people in a hurry, they can always whip up a stew. You have to be able to adapt and provide, friend. That's our role here. We're here to make sure people eat. When food is abundant, we can be as lavish as we please. When I'm in a hurry or out of supplies, I like to throw some [beetle claws] in some boiling broth and... bam! It's soup!");
	elseif(e.message:findi("beetle claws")) then
		e.self:Say("Beetle claw stew is quick, easy, and fills stomachs. The main ingredient comes from the Rhino Beetles that can be found in abundance around the city. We use the claws in a variety of dishes, so we can always use a few more. Here, I can give you a bag if you want to go gather some for me. Just fill it up and come back.");
		e.other:SummonCursorItem(17074); -- Item: Stained Mesh Bag
	elseif(e.message:findi("broth")) then
		e.self:Say("I can make broth from just about anything. Meat, water, and spices can be turned into a base broth for just about and stew or sauce. The current favorite around here comes from the meat of the large worms that come up from the earth around the base of our city. I know that they look horrid, but they really do taste great! If you want to help, I will pay for every four servings that you bring me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local chanceitem = 0;
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10390, item2 = 10390, item3 = 10390, item4 = 10390})) then
		e.self:Emote("looks at each piece of meat before wrapping them in a spiced cloth. 'These look like good cuts of meat. I hope that this will suffice as payment,' he says as he stacks the wrapped meat on the counter.");
		e.other:QuestReward(e.self,0,0,4,0,eq.ChooseRandom(30580,30577,30579,30572),1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10391})) then
		e.self:Emote("tosses the bag in a pile with several others and hands you your payment. 'Thank you very much,' he says. 'The more of these that I can gather, the better. I always seem to be low.'");
		if(math.random(100) < 35) then
			chanceitem = eq.ChooseRandom(30581,30578,2752,2754,2758);
		end
		e.other:QuestReward(e.self,0,0,6,0,chanceitem,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5559})) then
		e.self:Say("I'd love to fill this order, but we're out of the meat that he likes. We've been very busy today, so I doubt that any of us will be able to get out to gather more of it. If you could go out and grab us a few slabs, we could not only fill the order, I could put some away for anyone else that may come through today. This sounds like a perfect task for a young Taruun recruit. Fill this bag with the fatty meat from a young Owlbear and bring it back to me right away. I'll get Joharr's sandwiches as soon as you return with the meat.");
		e.other:QuestReward(e.self,0,0,0,0,17608);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5562})) then
		e.self:Emote("opens the bag and immediately begins to slice the meat into thin sheets. He throws the meat on a few slices of bread and wraps the whole thing up with a hand full of vegetables. 'Here you go, friend!' He says as he hands you what appears to be a lunch bag. 'Joharr should love these sandwiches! The meat that you brought us was great. If you ever need a job as a butcher, just let us know. Take care and tell Joharr I said hello.'");
		e.other:Faction(e.self,1513,5); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,5563,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
