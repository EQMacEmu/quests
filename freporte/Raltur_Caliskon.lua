function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the rage of Innoruuk flow through your veins. Welcome " .. e.other:GetCleanName() .. ". Soon the Dismal Rage shall run rampant in the streets of Freeport. Our numbers grow. Like you, so many feel the rage within. It is now time to [ serve Innoruuk ].");
	elseif(e.message:findi("serve innoruuk")) then
		e.self:Say("Wise choice. We of the Dismal Rage have learned of the value of incompetence. As the Teir'Dal use the ogres and the trolls so to shall the Dismal Rage have A pawn in this game. Ours is the Freeport Militia. They trust us. How unfortunate for them. I want you to go speak with Sir Lucan D'lere, the so called ruler of this city and leader of this mob of ruffians called the Freeport Militia. Tell him you are [ from the Shrine of Innoruuk ]. Do as he asks. Little favors lead to large debts. And if you should find something of importance, bring it to me not that inept warrior.");
	elseif(e.message:findi("mission")) then
		e.self:Say("Antonius Bayle has created a strong alliance with certain groups from four other cities. He and his allies are clearly up to no good, or rather, all good. We require more information. Visiting our fair city is a woman called Lady Shae. We have learned that she is heading to Qeynos soon, returning something called the [Bayle List]. Find her before she leaves. Bring me her Bayle List III.");		
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18816})) then
		e.self:Say("So the great Antonius Bayle wishes to ally himself with the mighty Knights of Truth. How pathetic. It would appear that the alliance has spawned infiltrators of sorts. Of course, we of the Dismal Rage are already aware of this, but I am sure Sir Lucan D'Lere knows nothing as usual. I have a [mission] for any evil shadowknight of Innoruuk.");
		e.other:Faction(e.self,271,20); -- Faction: Dismal Rage
		e.other:Faction(e.self,281,-3); -- Faction: Knights of Truth
		e.other:Faction(e.self,296,4); -- Faction: Opal Dark Briar
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18810})) then
		e.self:Say("You have done well. This is the Bayle List. I have heard of it. It is useless without the remaining two parts. Take the list. You must collect the other two pieces of the list and take them to a scribe by the name of Rathmana Allin. He can be found in the deserts of South Ro. First, you must go ask Venox Tarkog what the Bayle List is. He is here in the shrine and will fill you in on your mission.");		
		e.other:QuestReward(e.self,0,0,0,0,18810,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10100 -- Raltur_Caliskon
