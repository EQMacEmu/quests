--Planar Armor Exchange

function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:Race() == "Dark Elf" or e.other:Race() == "Iksar" or e.other:Race() == "Troll" or e.other:Race() == "Ogre" or e.other:Class() == "Shadowknight" or e.other:Class() == "Necromancer") then
			e.self:DoAnim(48);
			e.self:Emote("stands tall, eyeing " .. e.other:GetCleanName() .. " before her with neither disdain nor favor as she delivers a proper nod of greetings. 'Greetings to you, dark one. You stand within the district of Tanaan -- the cornerstone of neutrality not only within this plane, but within the universe. In no place within the known, infinite cosmos will you find this perfect a balance of intelligent and willful minds. We do not have an adversity to your presence among us, should you choose to yield to our wishes and keep your dark intents and purposes within the recesses of your mind until you return to Norrath. Be wary, dark one, if this is your final destination within the Plane of Knowledge before you return to your native soil, for our devices will take you to a place that may not take kindly to your presence. I suggest you return to Kartis, where your kind would hold you in higher regard and favor and the means to return to your home would be less catastrophic in their consequences.'");
		else
			e.self:DoAnim(70);
			e.self:Emote("gives a formal bow at the waist in an almost regal greeting toward " .. e.other:GetCleanName() .. ". 'Good day to you , traveler, and may Tunare's gracious hand guide your fate with freedom.  I am Warder Elwysaie, a soldier and guardian of nature in my life upon Norrath. Here, I am a soldier still but one of faith and knowledge. I set my blades down long ago, and though I understand most gravely that the shadow of corruption that threatens this delicate and necessary balance still looms most deadly over us, I was no longer able to be nature's wrath adn vengeance. It was then that I heard the calling of New Tanaan and eagerly I followed to this place of neutrality. In the recent times where Norrath's travelers who have yet to appeal to the Plane of Knowledge grace us as visitors and students of our ways, I have volunteered my former status and knowledge to any young ranger who may need guidance in their skills as they grow in power.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {4891, 4892, 4893, 4894, 4895, 4896, 4897}); --Thorny Vine Armor
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
