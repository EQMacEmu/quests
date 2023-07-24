function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations! The Song Weavers are always glad to add a new voice to the choir.  In addition to your voice. will you also [fetch spiderling silk]?  We need some to replace our worn lute strings.  Carry out this task in high tempo and we will show our gratitude.");
	elseif(e.message:findi("spiderling silk")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Very spirited of you!!  Gather four spiderling silk and return them to me.  Good hunting. my friend!!");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18783})) then -- Tattered Note
		e.self:Say("Greetings. friend. I am Sylia.  I see that you wish to join our humble guild.  Good.  Here is a gift for you - your guild tunic.  Let's get started with your training, shall we?");
		e.other:Faction(e.self,401,100); -- Song Weavers
		e.other:QuestReward(e.self,0,0,0,0,13534,20); -- Faded Brown Tunic
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13099,item2 = 13099,item3 = 13099,item4 = 13099})) then
		e.self:Say("Splendid job! Now if you can just keep a tune, you'll be a fine bard.");
		e.other:Faction(e.self,401,5); -- Song Weavers
		e.other:QuestReward(e.self,0,0,math.random(5),0,13000,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54088 -- Sylia_Windlehands
