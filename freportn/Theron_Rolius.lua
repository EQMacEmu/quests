function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "!  To enter these grounds is to proclaim your faith in the Truthbringer.  In this city you shall find no greater allies than the Knights of Truth.  We urge all knights and clerics who oppose the hand of the Freeport Militia to [join the crusade].");
	elseif(e.message:findi("join the crusade")) then
		e.self:Say("Then take arms against the Freeport Militia!  They serve no one save Sir Lucan, the fallen knight.  From this day forth, I put a bounty upon all militia members.  For every bashed milita helm, a reward!!  If you are not prepared to battle the militia just yet, you may [assist in other areas].");
	elseif(e.message:findi("assist in other areas")) then
		e.self:Say("I have need of one such as you.  I have been awaiting a message. I will need a young acolyte to [retrieve the message] for me or there are also some [fishing duties] I wish to delegate.");
	elseif(e.message:findi("retrieve the message")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. ". Venture to the Commonlands.  There, by a lake, will be a courier from the great city of Qeynos.  Tell him you are from the Hall of Truth.  He will have a message for you to deliver to Eestyana Naestra.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Work on the ways of valor before we discuss such things. You are on the righteous path of the Truthbringer, but there is more work to do.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	elseif(e.message:findi("fishing duties")) then
		e.self:Say("I have been creating shields for the crusade.  Right now I work on the sharkskin shield for the knights.  I require two shark skins. Unfortunately, most sharks are too dangerous for the squires.  I have begun using [reef shark] skins.  Will you hunt the [reef sharks]?");
	elseif(e.message:findi("reef shark")) then
		e.self:Say("Reef sharks are the smallest and most docile of the sharks.  Even a young acolyte can slay one.  I have heard there are some in the Ocean of Tears.  I need a young acolyte to [hunt] reef sharks.  I require their skins.");
		e.other:SummonCursorItem(17937); -- Item: Empty Shark Sack
	elseif(e.message:findi("hunt")) then
		e.self:Say("I thought I spied the shoulders of a swimmer upon you! Take this large sack. Travel to the Ocean of Tears. There are numerous reef sharks there. I shall require no fewer than two shark skins. When the full sack is combined and returned to me, I shall reward you.");
	elseif(e.message:findi("heal")) then
		e.self:Say("If you require the binding of wounds you should speak with Palious Jartan in the temple. He will be glad to help you.");
	end
 end

function event_trade(e)
	local item_lib = require("items");
	local dmh = item_lib.count_handed_item(e.self, e.trade, {13921});

	if(e.other:GetFactionValue(e.self) >= -500 and (dmh > 0))  then -- Damaged Militia Helmet - 13921
		repeat
		e.self:Say("Fantastic work, my young knight.  Here is a small token of the my appreciation.  I would offer you a sharkskin shield, but I have made only a few and the paladins are testing them.");
		e.other:Faction(e.self,281,25,0); -- knights of truth
		e.other:Faction(e.self,271,-3,0); -- dismal rage
		e.other:Faction(e.self,330,-3,0); -- freeport militia
		e.other:Faction(e.self,362,5,0); -- priests of marr
		e.other:Faction(e.self,311,2,0); -- steel warriors
		e.other:QuestReward(e.self,0,0,0,3,0,1000);
			dmh = dmh - 1;
		until dmh == 0
	end	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13873})) then
		e.self:Say("Thanks for the hard work, here is a shield to help you in your duties.");
		e.other:Faction(e.self,281,25,0); -- knights of truth
		e.other:Faction(e.self,271,-3,0); -- dismal rage
		e.other:Faction(e.self,330,-3,0); -- freeport militia
		e.other:Faction(e.self,362,5,0); -- priests of marr
		e.other:Faction(e.self,311,2,0); -- steel warriors
		e.other:QuestReward(e.self,0,0,0,0,13868,500); -- Item: Sharkskin Shield
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportn  ID:8073 -- Theron_Rolius
