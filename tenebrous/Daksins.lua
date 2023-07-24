-- Daksins' Vampyre Antidote

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello traveller, what brings you to these cursed mountains? If I were you I would turn back now, all that really lies ahead of you is certain death. The vampires that inhabitant these mountains are some of the fiercest and most skilled.");
	elseif(e.message:findi("return the extract")) then  -- can retrieve the item without any advances and at dubious
		e.self:Say("I suppose I could trust you to return it to Zimloro. You have earned my trust by going and slaying this beast for me. This will help me greatly as well as I must rest in Katta for a few days to recover from the wounds I received at the hands of these monsters. Please return this bag that contains the extract along with other components that Zimloro asked me to retrieve to him. Thank you, " .. e.other:GetCleanName() .. ", I am forever in your debt.");
		e.other:SummonCursorItem(4765);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4764}, 0)) then
		e.self:Say("I see you were sent by my friends from back home. I understand that they are very worried about me but they must understand that I am doing this to help my sister and anyone else infected by this horrible beasts. If only I could receive some help in collecting a vampyre blood extract sample I could return it home along with the other components that Zimloro decribes in this letter.");
		-- confirmed faction from live.
		e.other:Faction(e.self,1512,25); -- house of stout
		e.other:Faction(e.self,1508,2); -- trader of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2693}, 0)) then
		e.self:Say("The blood of one of the cursed! You have done it, " .. e.other:GetCleanName() .. ". You must be a very skilled fighter to have bested one of these vile creatures. All that needs to be done now is to return this extract along with the other antidote supplies that I have prepared to Zimloro. Will you return this extract?");
		-- confirmed faction from live.
		e.other:Faction(e.self,1512,25); -- house of stout
		e.other:Faction(e.self,1508,2); -- trader of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
