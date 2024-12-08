function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("HA! Greetings there, " .. e.other:GetCleanName() .. "!  How are ya this fine day?  Me?  I'm doing all right.  Guard duty down here always reminds me of home.");
		eq.signal(10106,1); -- Signal to Beur_Tenlah
	elseif(e.message:findi("message")) then
		e.self:Say("Ok, " .. e.other:GetCleanName() .. ", I need you to take this message to Janam in West Freeport. He is usually hanging out in front of the Theater of the Tranquil with that good-for-nothing Rebby. Anyway, give this note to Janam and bring his reply back to me.");
		e.other:SummonCursorItem(18015); -- Note to Janam
	end
end

function event_signal(e)
	-- Signal from Beur_Tenlah
	if(e.signal == 1) then
		e.self:Say("Bah! Don't listen to this fool. Listen, I've something a little more important for you to do than buy ales. I need you to take a [message] to my friend Janam over in West Freeport.");
	elseif(e.signal == 2) then
		e.self:Say("Yeah, yeah, shut your stinky can, big, tall and ugly! Bwa ha ha!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18016})) then -- Note to Harkin
		e.self:Say("Ah, good work, " .. e.other:GetCleanName() .. ". And quick too, I'll makes sure that Elisi hears of your loyal work. Here... take this for your efforts.. it's not much, but it's all I have on me right now.");
		e.other:Faction(e.self,336,20,0); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,229,20,0); -- Coalition of Trade Folk
		e.other:Faction(e.self,329,2,0); -- Carson McCabe
		e.other:Faction(e.self,230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,3,0); -- Freeport Militia
		e.other:QuestReward(e.self,math.random(10),math.random(5),0,0,1054,1500); -- Used Merchants Gloves
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:freporte  ID:10107 -- Harkin_Duskfoot
