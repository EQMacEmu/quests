function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- requires indifferent	
			e.self:Say("Greetings, fellow traveler! I gotta tell ya. I love this town. Especially Crow's. Although the crowd seems a bit shadier than other places of the sort.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end		
	elseif(e.message:findi("testament of vanear")) then
		e.self:Say("So you have heard that good old Moodoro has knowledge of the Testament of Vanear. I care little for that book. Of course I have it!! If you want it, I will sell it to you for two gold pieces.");
	elseif(e.message:findi("ran")) then
		e.self:Say("Ran Flamespinner is a librarian in Highpass Hold.");
	elseif(e.message:findi("page 34")) then
		e.self:Say("So, you know I have page 34. Pretty smart of me to tear the most important page out before someone else tried, eh? If you really want it, then sit down and deal in. Ante is 4 gold. I will give you one card. If it is a jester, then I will give you the page. Let's do it.");
	elseif(e.message:findi("tonic")) then
		e.self:Say("I need some of Erud's tonic water. There is a merchant in Erudin who sells it.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 6) then
		e.self:Say("<urp>.. I don't feel so well.");
		eq.signal(2091,1,1); -- NPC: Flynn_Merrington
	elseif(e.wp == 14) then
		eq.set_anim(2040,1);
		e.self:Say("Ooooh.. Bllaughhh.. Ooh.. I need some tonic.");
	end
end

function event_signal(e)

	if(e.signal == 1) then
		e.self:Say("HA! HA! HA! Oh...  <burp> HA!  HA!  HA! How pitiful! HA! HA!");
	end		
	
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13118})) then
		e.self:Say("Oh thank the maker you have returned. Here is a little something in return");
		-- Confirmed Live Faction
		e.other:Faction(e.self,233,20,0); -- Faction: Crimson Hands
		e.other:Faction(e.self,266,2,0); -- Faction: High Council of Erudin
		e.other:Faction(e.self,265,-3,0); -- Faction: Heretics
		e.other:Faction(e.self,267,2,0); -- Faction: High Guard of Erudin
		e.other:QuestReward(e.self,math.random(10),0,0,0,0,20000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13994})) then
		e.self:Say("Lucky you. We were hoping to really clean you out. Here you go. Take the page. Even together, the book is nothing more than fiction.");
		e.other:QuestReward(e.self,0,0,0,0,13836); -- Item: Page 34 of a Book
	elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 4})) then
		e.self:Say("Well, what do you have?!!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(13994,13993,13992,13995));
	elseif(item_lib.check_turn_in(e.self, e.trade, {gold = 2})) then
		e.self:Say("HA!! I hope you enjoy the book. It is missing pages 30 and 34. It is nothing more than garbage without them. A rogue ripped them from their bindings and sold them to [Ran].");
		e.other:QuestReward(e.self,0,0,0,0,17918); -- Item: Testament of Vanear
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Emote(string.format("'s corpse says 'I'll get you back %s!'",e.other:GetCleanName()));
end
