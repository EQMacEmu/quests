function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("I am Toala Nehron. You must be another young warrior aspiring to join the ranks of the Steel Warriors. We welcome all who would try. When you [have time] there is a friend of mine I would like you to check on.");
	elseif(e.message:findi("opal")) then
		e.self:Say("Opal Darkbriar is a little plague rat.  She has used her knowledge of arcane arts to charm [Cain Darkmoore].  I know that is what happened.  Why else would he be in love with her?  He is a mighty warrior and she is nothing more than a sickly little librarian for the Academy of Arcane Science.  He must truly yearn for a bold hearted female warrior such as myself.  Not that I care, of course.");
	elseif(e.message:findi("cain darkmoore")) then
		e.self:Say("Cain Darkmoore is only the most handsome of warriors!  He is also the strongest and most bold.  He has slain the mightiest of fiends.  He is truly the manliest man around.  It is no wonder he is the guildmaster of the Steel Warriors.");
	elseif(fac < 5) then
		if(e.message:findi("have time")) then
			e.self:Say("I have A friend by the name of [Lenka Stoutheart]. She reported to me that her ship was broken into and someone stole a pouch of hers. Could you go look into it for me? Just tell her Toala sent you. Oh, and pay no mind to the walking mountain by her. That will only be Bronto, her navigator. Thanks friend.");
		elseif(e.message:findi("lenka stoutheart")) then
			e.self:Say("Lenka Stoutheart is an old friend of mine. I met her in my younger days when the Steel Warriors sent me to train in the ways of the Wolves of the North, the barbarian warriors of Halas. She is now an adventurer of great renown. She travels from continent to continent aboard her ship,the Blue Beast, her ship.");
		end
	elseif(fac == 5) then
		if(e.message:findi("have time") or e.message:findi("lenka stoutheart")) then
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to prove your worth to this guild.");
		end	
	elseif(fac > 5) then
		if(e.message:findi("have time") or e.message:findi("lenka stoutheart")) then
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);

	if(fac < 5) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18814})) then -- A Sealed Letter ID-18814 filename "NERtoShintl"
			e.self:Say("Why, that little trollop! What is she up to? Cain will never believe this! She must be in league with some faction of the dark elves, but why? Neither the Academy of Arcane Science nor Cain will believe this note. I will see what I can do. As for you, I command you to kill this Shintl and her dark elf courier Hollish!! Put their heads into this box and combine them. We shall cut the link. Bring me thier heads.");
			e.other:QuestReward(e.self,0,0,0,0,17971,500); -- Toala's Box for heads
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12246})) then -- Box with Two Heads
			e.self:Say("Good work!! We will soon catch Opal. I have started to formulate a plan to stop her. When I complete it, I shall notify you. Here. Take this small reward. I am sure killing Shintl was no trouble. She was just a halfling.");
			e.other:Faction(e.self,311,10); -- Steel Warriors
			e.other:Faction(e.self,262,2); -- Guards of Qeynos
			e.other:Faction(e.self,281,2); -- Knights of Truth
			e.other:Faction(e.self,230,-1); -- Corrupt Qeynos Guards
			e.other:Faction(e.self,330,-1); -- Freeport Militia
			e.other:QuestReward(e.self,{silver = math.random(0,10),gold = math.random(0,5),platinum = math.random(0,1), itemid = eq.ChooseRandom(2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 9002), exp = 2000})
		end
	elseif(fac == 5) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18814})) then -- Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		end
	elseif(fac > 5) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18814})) then -- Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw -- Toala_Nehron
