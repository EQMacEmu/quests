--This iksar knight is actually Grizzle, for the fourth quest in the Greenmist line, The Test of the Zealot.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("wipes the sweat from his forehead and spits some flarefire seeds on the ground near your feet. 'Whew!! Good to be back and safe at the Cabilis Gate. The troopers will protect us.'");
	elseif(e.message:findi("chalp diagram")) then --Test of the Zealot (Greenmist Quest 4/8)
		e.self:Emote("spits out some flarefire seeds. 'Great!! Sent to retrieve the Chalp diagram. I will give them to you, but I want you to do me a little favor first. I want you to [retrieve some spells] I lost. They are incorrectly scribed and useless, but I yearn for their return nonetheless.'");
	elseif(e.message:findi("retrieve some spells")) then --Test of the Zealot (Greenmist Quest 4/8)
		e.self:Emote("spits flarefire seeds on you. 'Oops!! Sorry. Yeah!! You go to Chalp and get two incorrectly scribed spells which they grabbed from me. The third one, I threw in a river crossing by Chalp. It was in a bottle and probably drifted way down the river. Bring me all three and also a shovel and I will make it worth your while.'");
	elseif(e.message:findi("flarefire seeds")) then --Test of the Zealot (Greenmist Quest 4/8)
		e.self:Emote("spits some flarefire seeds on your face. 'What? Interested in flarefire seeds? There you go. Ha!!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "spits flarefire seeds on your chest. 'Is this all? Listen up!! I asked for the misscribed spells; Fear, Lifetap and Gate, and also, a shovel.";			
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12492, item2 = 12493, item3 = 12494, item4 = 6026},1,nil,text)) then --Test of the Zealot (Greenmist Quest 4/8)
		e.self:Emote("accidently swallows a mouthful of flarefire seeds. 'ACCCKK!!  I can't believe you did it!! Here is the Chalp diagram.'");
		e.other:Faction(e.self,442,5); -- Faction: Crusaders of Greenmist
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,12496,1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
