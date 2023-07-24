--Signets of the Councilmen
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("regards you, and grins. 'Greetings, " .. e.other:GetCleanName() .. ". I am Councilman Taldarius, mighty Paladin of Mithaniel Marr and Guardian of the City of Tanaan! If you cannot find what you are looking for here in the Myrist library, I most certainly can add it to my list of things to look for in the Planes. Unfortunately, I am quite busy at the moment, planning my next trip to the Elemental Planes. I believe my aid may have some tasks he could use help with. That is, if you are skilled enough.'");
	elseif((e.message:findi("marked runed signet")) and e.other:HasItem( 16256)) then
		e.self:Say("I see you have helped Grimel immensely. He would not have given up his signet very easily. I cannot let him deprive himself of such a valuable tool. If you were to do a task for me I would grant you something I picked up in the Planes. Are you interested in the task?");
	elseif((e.message:findi("interested in the task")) and e.other:HasItem( 16256)) then
		e.self:Say("Very well " .. e.other:GetCleanName() .. ". I warn you I will not grant this without proof that you possess a valiant spirit. You may have the trust of my aid but I still require a noble deed. Through research done by the council they have discovered something called a Hope Stone that exists in the Elemental Planes. Bring me one of these stones and the signet of Grimel. Fear not I shall reward you well.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16256, item2 = 16258}) and not e.other:HasItem(16255) and not e.other:HasItem(16257)) then --Marked Runed Signet, Hope Stone
		e.self:Say("Wonderful! You have proven yourself as both a Master of the Trade as well as a valiant spirit. Take this and may it server you well! If this signet does not suffice, bring it back to me and i will exchange it for one more attuned to your needs.");
		e.other:QuestReward(e.self,0,0,0,0,16255); --Signet of Might
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16255})) then --Signet of Might
		e.self:Say("I hope this is more attuned to your needs.");
		e.other:QuestReward(e.self,0,0,0,0,16257); --Signet of the Arcane
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16257})) then --Signet of the Arcane
		e.self:Say("I hope this is more attuned to your needs.");
		e.other:QuestReward(e.self,0,0,0,0,16255); --Signet of Might
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
