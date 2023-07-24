-- final task in quest for the spell: divine might

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met. I am Simon Aldicott, a cleric in the service of Mithaniel Marr. I've been sent here to prepare a funeral service for one of our lost to join Marr in his kingdom.");
	elseif(e.message:findi("funeral service")) then
		e.self:Say("Are you the brave knight whom Valeron sent to meet me here? If so please place the remains in the coffin and seal it. Then hand me the coffin so that we may bless it in the waters of this lake.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6708})) then
		e.self:Emote("places the coffin in the water and begins to pray. 'Lord of Valor high above, take this knight, your loyal child, into thy kingdom and all that is holy! What is that thing!'");
		eq.spawn2(21031,0,0,2901,259.7,-51,25); --a tortured revenant
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 6709})) then
		e.self:Say("Thank you, Knight. With this task accomplished, I shall reward you with this scroll. It is an ancient spell that only the holiest of knights may cast. Remember your duty!");
		e.other:Faction(e.self,362,10,0); -- priests of marr
		e.other:Faction(e.self,330,-1,0); -- freeport militia
		e.other:Faction(e.self,281,1,0); -- knights of truth
		e.other:QuestReward(e.self,0,0,0,0,15693,20000); -- Item: Spell: Divine Might
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	e.self:Say("Tis a sad thing. His soul was twisted to its current state somehow and he thought YOU were the foul Teir'Dal who destroyed him in the first place. But that is no matter..you have freed him to stand by Marrs side once more! Now, give me the ash so that I may finally put him to rest. In return for your valor I shall provide you with an ancient spell unknown to most Holy Knights of Marr.");
end	

-- EOF zone: commons npc: Simon_Aldicott
