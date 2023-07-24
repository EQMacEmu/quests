local helper = {}

helper.ARMOR_GEMS = {
	Chipped_Onyx_Sapphire=25827,
	Crushed_Lava_Ruby=25840,
	Crushed_Opal=25836,
	Jaundice_Gem=25815,
	Black_Marble=25805,
	Crushed_Coral=25831,
	Flawless_Diamond=25814,
	Flawed_Emerald=25821,
	Flawed_Topaz=25818,
	Crushed_Flame_Emerald=25838,
	Crushed_Topaz=25832,
	Flawed_Sea_Sapphire=25825,
	Crushed_Black_Marble=25833,
	Nephrite=25816,
	Crushed_Onyx_Sapphire=25841,
	Crushed_Flame_Opal=25837,
	Pristine_Emerald=25807,
	Crushed_Jaundice_Gem=25829
}

helper.THURG_ARMOR = {
	Breastplate=24928,
	Chain_Boots=24938,
	Chain_Bracer=24939,
	Chain_Coif=24940,
	Chain_Gauntlets=24941,
	Chain_Leggings=24936,
	Chain_Sleeves=24937,
	Chain_Tunic=24935,
	Plate_Boots=24931,
	Plate_Bracer=24932,
	Plate_Gauntlets=24934,
	Plate_Greaves=24929,
	Plate_Helmet=24933,
	Plate_Vambraces=24930,
	Silk_Boots=24952,
	Silk_Gloves=24955,
	Silk_Pantaloons=24950,
	Silk_Robe=24949,
	Silk_Sleeves=24951,
	Silk_Turban=24954,
	Silk_Wristband=24953,
	Leather_Boots=24945,
	Leather_Bracelet=24946,
	Leather_Cap=24947,
	Leather_Gloves=24948,
	Leather_Leggings=24943,
	Leather_Sleeves=24944,
	Leather_Tunic=24942
}

helper.SKYSHRINE_ARMOR = {
	Breastplate=24956,
	Chain_Boots=24966,
	Chain_Bracer=24967,
	Chain_Coif=24968,
	Chain_Gauntlets=24969,
	Chain_Leggings=24964,
	Chain_Sleeves=24965,
	Chain_Tunic=24963,
	Leather_Boots=24973,
	Leather_Bracelet=24974,
	Leather_Cap=24975,
	Leather_Gloves=24976,
	Leather_Leggings=24971,
	Leather_Sleeves=24972,
	Leather_Tunic=24970,
	Plate_Boots=24959,
	Plate_Bracer=24960,
	Plate_Gauntlets=24962,
	Plate_Greaves=24957,
	Plate_Helmet=24961,
	Plate_Vambraces=24958,
	Silk_Boots=24980,
	Silk_Gloves=24983,
	Silk_Pantaloons=24978,
	Silk_Robe=24977,
	Silk_Sleeves=24979,
	Silk_Turban=24982,
	Silk_Wristband=24981
}

helper.KAEL_ARMOR = {
	Breastplate=24900,
	Chain_Boots=24910,
	Chain_Bracer=24911,
	Chain_Coif=24912,
	Chain_Gauntlets=24913,
	Chain_Leggings=24908,
	Chain_Sleeves=24909,
	Chain_Tunic=24907,
	Plate_Greaves=24901,
	Plate_Boots=24903,
	Plate_Bracer=24904,
	Plate_Gauntlets=24906,
	Plate_Helmet=24905,
	Plate_Vambraces=24902,
	Silk_Boots=24924,
	Silk_Gloves=24927,
	Silk_Pantaloons=24922,
	Silk_Robe=24921,
	Silk_Sleeves=24923,
	Silk_Turban=24926,
	Silk_Wristband=24925,
	Leather_Boots=24917,
	Leather_Bracelet=24918,
	Leather_Cap=24919,
	Leather_Gloves=24920,
	Leather_Leggings=24915,
	Leather_Sleeves=24916,
	Leather_Tunic=24914
}

helper.THURG_PLATE_TEXT = {
	helm="To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.",
	breastplate="For the breastplate, I will need a corroded breastplate and three flawless diamonds. Once I have them in my possession it will not take long to craft a sturdy breastplate.",
	armplate="Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.",
	bracer="For the bracers, I will require a corroded plate bracer and a set of three crushed flame emeralds. Return to me if you happen to find these things in your travels.",
	gauntlet="Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.",
	greaves="A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires. With the right techniques almost anything is possible.",
	boots="Boots made for battle are not always the most comfortable available. However, if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble."
}

helper.THURG_CHAIN_TEXT = {
	coif="To create a piece of armor to protect your sensitive skull. I will require three pieces of crushed coral as well as a corroded chain coif.",
	tunic="To forge a spectacular chain tunic I will require three flawless diamonds and a corroded chain tunic.  With the gems and my skills I may be able to draw out some of its magical powers.",
	sleeves="Protection for your arms will come at the price of three flawed emeralds and a set of corroded chain sleeves.",
	bracer="For the bracers, I will require a corroded chain bracer as well as three crushed flame emeralds. Return to me when you find such things -race",
	gauntlets="Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded chain gauntlets and three crushed topaz.",
	leggings="A set of corroded chain leggings might be salvageable if you were to find three flawed sea sapphires.  With the right techniques and ingredients almost anything is possible.",
	boots="We use our feet so often, should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet, return to me with three pieces of crushed black marble and a set of corroded chain boots."
}

helper.THURG_SILK_TEXT = {
	cap="For an enchanted head guard bring me a torn enchanted silk turban as well as three pieces of crushed flame opal.",
	robe="If you wish to have a fine robe, bring unto me a torn enchanted silk robe and three pristine emeralds. Then you will receive a robe beyond your wildest dreams.",
	sleeves="Bring unto me a set of torn enchanted silk sleeves as well as three flawed topaz.  With these in my possession I can create a set of enchanted sleeves the likes of which spellcasters like you dream of.",
	wristband="An enchanted silk wristguard and three crushed onyx sapphires is all that I require to create an imbued wrist wrap of great power.  Seek out these items and return to me when you have acquired them.",
	legging="Three nephrite and a pair of torn enchanted silk leggings will net you a fine set of pantaloons.",
	boots="Three crushed jaundice gems combined with torn enchanted silk boots would make a most interesting set of footwear.  The latent powers of the gems can be harnessed to create magical effects.",
	gloves="If you seek gloves of great power, bring to me three crushed topaz and a pair of torn enchanted silk gloves.  I will use the power of the gems to imbue the gloves."
}

helper.THURG_LEATHER_TEXT = helper.THURG_CHAIN_TEXT;

helper.THURG_PRIEST_TEXT = {
	helm="To create a piece of armor to protect your skull I will require three crushed onyx sapphires as well as a corroded plate helmet.",
	breastplate="For the breastplate, I will need a corroded breastplate and three black marbles. Once I have them in my possession it will not take long to craft a sturdy breastplate.",
	armplate="Protection for your arms will come at the price of a set of corroded plate vambraces and three jaundiced gems.",
	bracer="For the bracers, I will require a corroded plate bracer and a set of three crushed opals. Return to me if you happen to find these things in your travels.",
	gauntlet="Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed lava rubys.",
	greaves="A set of corroded greaves might be salvageable if you were to find three chipped onyx sapphires. With the right techniques almost anything is possible.",
	boots="Boots made for battle are not always the most comfortable available. However, if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed flame emerald."
}

function helper.merge_tables(orig, other)
	for k,v in pairs(other) do orig[k] = v end
	return orig;
end

function helper.quest_text(e, table, faction)
	local _faction = e.other:GetFaction(e.self);
	if (_faction <= faction) then
		for trigger, text in pairs(table) do
			if (e.message:findi(trigger)) then
				text = text:gsub("(-name)", e.other:GetCleanName());
				text = text:gsub("(-race)", e.other:Race());
				text = text:gsub("(-class)", e.other:Class());
				e.self:Say(text);
				return;
			end
		end
	else
		e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
	end
end

function helper.quest_text_skyshrine(e, table, faction)
	local _faction = e.other:GetFaction(e.self);
	if (_faction <= faction) then
		for trigger, text in pairs(table) do
			if (e.message:findi(trigger)) then
				text = text:gsub("(-name)", e.other:GetCleanName());
				text = text:gsub("(-race)", e.other:Race());
				text = text:gsub("(-class)", e.other:Class());
				e.self:Say(text);
				return;
			end
		end
	else
		e.self:Say("You must prove your dedication to the Claws of Veeshan before I will speak to you.")
	end
end

function helper:quest_turn_in(event, faction_req, items, callback)
	local item_lib = require("items");
	local faction = event.other:GetFaction(event.self);
	if (faction <= faction_req) then
		for i, quest in ipairs(items) do
			if(item_lib.check_turn_in(event.self, event.trade, quest.turn_in)) then
				callback(self, event);
				event.other:QuestReward(event.self,0,0,0,0, quest.reward, 100);
				return;
			end
		end
	end
	item_lib.return_items(event.self, event.other, event.trade)
end

function helper.thurg_armor_faction(e)
	local COLDIAN = 406;
	local DAIN = 405;
	local KROMRIF = 419;
	local KROMZEK = 448;
	-- verified live faction
	e.other:Faction(e.self,COLDIAN, 75);
	e.other:Faction(e.self,DAIN, 18);
	e.other:Faction(e.self,KROMZEK, -1);
	e.other:Faction(e.self,KROMRIF, -37);
end

function helper:thurg_armor_success(e)
	e.self:Emote("smiles warmly as he hands you your reward. 'You have done well, " .. e.other:GetCleanName() .. "'");
	self.thurg_armor_faction(e);
 end

function helper.skyshrine_armor_faction(e)
	local CoV = 430;
	local YELINAK = 436;
	local KROMZEK = 448;
	e.other:Faction(e.self,CoV, 75);
	e.other:Faction(e.self,YELINAK, 18);
	e.other:Faction(e.self,KROMZEK, -37);
end

function helper:skyshrine_armor_success(e)
	e.self:Say("Excellent! I had not thought that one such as you would be able to complete such a task. Now I will hold up my end of the bargain. Here is the armor that I promised I would fashion for you upon returning these items to me. Wear it with pride! ");
	self.skyshrine_armor_faction(e);
end

function helper.kael_armor_faction(e)
	local KINGTORMAX = 429;
	local KROMZEK = 448;
	local CoV = 430;
	local KROMRIF = 188;
	-- verified live faction
	e.other:Faction(e.self,KROMZEK, 75);
	e.other:Faction(e.self,KROMRIF, 18);
	e.other:Faction(e.self,KINGTORMAX, 18);
	e.other:Faction(e.self,CoV, -37);
end

function helper:kael_armor_success(e)
	e.self:Emote("smiles warmly as he hands you your reward. 'You have done well, " .. e.other:GetCleanName() .. "'");
	self.kael_armor_faction(e);
end

function helper:quest_turn_in_item(gem, armor, reward)
	return {turn_in={item1=gem, item2=gem, item3=gem, item4=armor}, reward=reward}
end

--Melee

function helper:melee_boots(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Black_Marble, armor, reward)
end

function helper:melee_legs(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Flawed_Sea_Sapphire, armor, reward)
end

function helper:melee_gloves(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Topaz, armor, reward)
end

function helper:melee_bracer(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Flame_Emerald, armor, reward)
end

function helper:melee_helmet(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Coral, armor, reward)
end

function helper:melee_arms(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Flawed_Emerald, armor, reward)
end

function helper:melee_chest(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Flawless_Diamond, armor, reward)
end

--Caster

function helper:silk_boots(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Jaundice_Gem, armor, reward)
end

function helper:silk_legs(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Nephrite, armor, reward)
end

function helper:silk_gloves(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Topaz, armor, reward)
end

function helper:silk_bracer(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Onyx_Sapphire, armor, reward)
end

function helper:silk_helmet(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Flame_Opal, armor, reward)
end

function helper:silk_arms(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Flawed_Topaz, armor, reward)
end

function helper:silk_chest(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Pristine_Emerald, armor, reward)
end

--Priest

function helper:priest_helmet(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Onyx_Sapphire, armor, reward)
end

function helper:priest_chest(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Black_Marble, armor, reward)
end

function helper:priest_arms(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Jaundice_Gem, armor, reward)
end

function helper:priest_bracer(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Opal, armor, reward)
end

function helper:priest_gloves(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Lava_Ruby, armor, reward)
end

function helper:priest_legs(armor, reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Chipped_Onyx_Sapphire, armor, reward)
end

function helper:priest_boots(armor,reward)
	return self:quest_turn_in_item(self.ARMOR_GEMS.Crushed_Flame_Emerald, armor, reward)
end

return helper;
