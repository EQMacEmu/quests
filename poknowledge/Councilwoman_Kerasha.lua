--Essences of Power
function event_say(e)
	
	if ( e.other:HasItem(16260) ) then -- Tiny Gold Fist
		if ( e.message:findi("hail") ) then
			e.self:Say("Greetings " .. e.other:GetCleanName() .. "!  It pleases me very much that you were able to help Eino out in his time of need.' Councilwoman Kerasha glances at Eino, 'Tunare only knows what I would do without him at my side.  There is another matter at hand that has come to the attention of the council that is beyond even our combined power and requires the aid of a powerful alliance.  Would you be willing to aid Tanaan?");
		elseif(e.message:findi("aid")) then
			e.self:Say("A rift in this plane at the point of harmony upon which the city of Tanaan is built is crumbling. The other council members do not see it happening for they lack the sight that I possess. Granted it will take time but it is something that must be set to right or our home will fall to waste among the tides of the Planes.' Councilwoman Kerasha's body grows rigid. 'I did not spend my life in defense of this city to watch it crumble to dust! The way to repair the breach is difficult but I feel Tunare will grant me the strength once I have the four essences of power in my grasp.");
		elseif(e.message:findi("essences of power")) then
			e.self:Say("The powers that watch over the four elemental planes all guard their respective essence of power. You must defeat each of them in turn and place them all within this sacred bowl. Once I have the combined power of the planes I can begin the ceremony and set the foundation of the city to rights. Thank you for your offer to assist me " .. e.other:GetCleanName() .. ".");
			e.other:SummonCursorItem(17183); --Sacred Bowl
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Greetings " .. e.other:GetCleanName() .. ". I am Councilwoman Kerasha, representative of the Selia district. I provide the voice of nature to the Council of Tanaan. Woe is the city in any realm that forgets to heed Mother Tunare. For where else could one draw strength from but the land?");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16266})) then --Power of the Planes
		e.self:Emote("takes the Power from you and hands it to Aid Eino. 'Thank you " .. e.other:GetCleanName() .. ". The energy I must expend to perform such a task is days in the gathering. The city of Tanaan is forever in your debt. Take this, it is but a small token of the gratitude of the city. If it does not suit you, return it to me and I shall give you another reward.'");
		e.other:QuestReward(e.self,0,0,0,0,32106); --Jade Hoop of Speed
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 32106})) then --Jade Hoop of Speed
		e.self:Say("I understand. Take this, may it serve you well, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,17209); --Frizznik's Endless Coin Purse
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 17209})) then --Frizznik's Endless Coin Purse
		e.self:Say("I understand. Take this, may it serve you well, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,32107); --Cord of Invigoration
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 32107})) then --Cord of Invigoration
		e.self:Say("I understand. Take this, may it serve you well, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,32108); --Mace of the Ancients
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 32108})) then --Mace of the Ancients
		e.self:Say("I understand. Take this, may it serve you well, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,32109); --Ring of Farsight
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 32109})) then --Ring of Farsight
		e.self:Say("I understand. Take this, may it serve you well, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,32106); --Jade Hoop of Speed
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
