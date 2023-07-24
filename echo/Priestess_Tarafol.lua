-- Helping the Forsaken

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, these poor forsaken souls. We must do whatever we can to help them. So far I've been unable to find anything that can cure their afflictions. I'm not even certain there is a cure. The least I've been able to do is ease some of their suffering.");
	elseif(e.message:findi("cure")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("I'm not certain what causes the disease that inflicts most of these people. I believe it's from living down in these caverns for so long. It seems most people have a natural immunity, but the few who are stricken are cursed to slowly rot to death. A most horrible and painful way to die. I wish I could do more than just ease their pain.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("help")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("You would be willing to do that? That would be great! I've heard of the possible curative powers of many things here on Luclin. I've been so busy here that I haven't been able to go out and search for any of the needed compounds. If you would be so kind as to collect some things for me I would be very appreciative.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("collect")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Ok, I need you to find these things... Underbulk Bile, Razorfungus Spores and Saprophyte Spores. You should be able to be find them within the nearby cavern systems. Please return to me once you have acquired all the ingredients. Thank you very much for assisting. Good luck.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 32403,item2 = 32510,item3 = 19836})) then
		e.self:Say("Thank you so much!! These will help so much in trying to find a cure for these people. Here, take this as a token of my gratitude.");
		e.other:QuestReward(e.self,0,0,0,0,19842);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
