function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Hall of Truth!  May the will of Mithaniel Marr guide you through life.  We are glad to see that you have an interest in our ways.  Please speak with any of my priests or knights and they shall help you find your faith.");
	elseif(e.message:findi("militia")) then
		e.self:Say("The Freeport Militia is nothing more than a ragtag band of mercenaries and convicts. They act as the guards of this troubled city. Be well aware that they are not the honorable guards you may think they are. They are commanded by Sir Lucan D'Lere, the self-proclaimed ruler of Freeport. We of the Hall of Truth shall set this city free from the grip of the Militia one day. It is our duty as Knights of Truth.");
	elseif(e.message:findi("heal")) then
		e.self:Say("If you require the binding of wounds you should speak with Palious Jartan in the temple. He will be glad to help you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18822})) then
		e.self:Say("You must be the young member of the Hall of Truth who was sent by Theron. I am glad to see you avoided any interference. Please take this as a reward for your service.");
		e.other:Faction(e.self,281,10,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,271,-1,0); -- Faction: Dismal Rage
		e.other:Faction(e.self,330,-1,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,362,2,0); -- Faction: Priests of Marr
		e.other:Faction(e.self,311,1,0); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,math.random(10),0,0,0,9985,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18816})) then
		e.self:Say("Thank you, defender of Karana! We have heard rumors of the followers of Bertoxxulous gaining knowledge of our knight who infiltrated the ranks of the [Militia]. They would have tried to sell the information to the Militia. We will inform our knight immediately. As for you, here is a donation to your journey's expenses. Stay clear of the Freeport Militia. There is no doubt they have learned of your alliance with us.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,281,20,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,271,-3,0); -- Faction: Dismal Rage
		e.other:Faction(e.self,330,-3,0); -- Faction: The Freeport Militia
		e.other:Faction(e.self,362,4,0); -- Faction: Priests of Marr
		e.other:Faction(e.self,311,2,0); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,0,math.random(10),math.random(0,2),eq.ChooseRandom(6016,13296),1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18735})) then -- Tattered Note
		e.self:Say("The Truthbringer welcomes you into his life. Here is the tunic of Marr. Wear it with pride and be sure to conduct yourself with valor.");
		e.other:Faction(e.self,281,100,0); -- knight of truth
		e.other:Faction(e.self,271,-15,0); -- dismal rage
		e.other:Faction(e.self,330,-15,0); -- freeport militia
		e.other:Faction(e.self,362,20,0); -- priest of marr
		e.other:Faction(e.self,311,10,0); -- steel warrior
		e.other:QuestReward(e.self,0,0,0,0,13554,20); -- Faded Purple Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
