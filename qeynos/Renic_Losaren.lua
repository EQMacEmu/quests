function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, " .. e.other:GetCleanName() .. ". Please feel at ease here in the Temple of Thunder. We, the Knights of Thunder, are here to guide and serve.");
	elseif(e.message:findi("karana") or e.message:findi("rainkeeper")) then
		e.self:Say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.")
	elseif(e.message:findi("bertoxxulous")) then
		e.self:Say("Bertoxxulous, the Plaguebringer, is the Lord of Disease. It is he who smites Norrath with his diseases and imperfections. Those who follow him are called [Bloodsabers].");
	elseif(e.message:findi("bloodsaber")) then
		e.self:Say("It is rumored that there is a shrine in the great city of Qeynos which pays homage to the Plaguebringer, Bertoxxulous. The members of this vile church of the damned are called the Bloodsabers. They are dreaded shadowknights, necromancers and evil clerics. It is our duty to destroy all who dare to pray to such a deity. Join our fight. Speak more of this matter with Chesgard Sydwend.");
	elseif(e.message:findi("heal")) then
		e.self:Say("If you need to be healed, I suggest you speak with the Priests of Life. You can find them in the Temple of Life on the other side of Qeynos. The only service you can pay for here is holy armor. Daedet Losaren charges followers of Karana for that blessing.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18715})) then -- Tattered Note
		e.self:Say("Welcome, friend, to the Temple of Thunder. Here, you can practice your skills and learn the ways of Karana. Take this tunic and wear it with pride, for you are now a Priest of Thunder. Guild Trainer Daedet Losaren will begin your tutoring, see him when you are ready.");
		e.other:Faction(e.self,280,100,0); -- Knight of Thunder
		e.other:Faction(e.self,221,-100,0); -- Bloodsabers
		e.other:Faction(e.self,341,75,0); -- Priest of Life
		e.other:Faction(e.self,262,75,0); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13505,100); -- Old Gray Tunic*
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
