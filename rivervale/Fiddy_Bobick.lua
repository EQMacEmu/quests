--------------------------
  --Quest Name:The Fishslayers
  --Author:Shaznito
  --NPCs Involved:Fiddy Bobick, Marshall Lanena
  --Items Involved:Bag of Piranha Teeth, Piranha Bag, Piranha Tooth
  ----------------------------------
function event_waypoint_arrive(e)
	if(e.wp == 6) then
		e.self:Say("When will Wickystick send help?!");
	end
end

function event_say(e) 
	if(e.message:findi("Hail")) then
		e.self:Say("Ahoy, mate!! The name's Fiddy Bobick! Perhaps you've heard of me.. the greatest halfling to sail the seas of Norrath? I have been to the North, South, East and West, and thank Prexus. I have survived it all!  Why I have returned to this little hollow is a wonder to me. Obviously, the salty air finally got to my brain!");
	elseif(e.message:findi("sent me")) then
		e.self:Say("Well, it's about blasted time!  The ship was about to sink.  Wickystick finally managed to send the troops in!  The problem, mate, is piranha !!  What?!!  That's what I said.  Piranha!  The lake is infested with the little buggers.  More and more every sunrise.  They're chomping down all our food supply.  You have gotta get your can in the drink and kill them.  Take one of their teeth to old Wickystick and see what she has to say about Fiddy then!  I will also give you some booty for any teeth you pull out of this river.  Well, get going, Deputy " .. e.other:GetCleanName() .. "!");  
	end
end
 
function event_trade(e)
local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13929})) then 
		e.self:Say("Whew!! We are sure on the way to saving this village, pal! They're gonna erect a statue in our names.  Fishslayers is what we are!  Let's keep up the good work!");
		e.other:Faction(e.self,292,1); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,241,1); -- Faction: DeepPockets 
		e.other:Faction(e.self,263,1); -- Faction: Guardians of the Vale  
		e.other:Faction(e.self,286,1); -- Faction: Mayor Gubbin 
		e.other:Faction(e.self,336,-1); -- Faction: Coalition of Tradefolk Underground
		e.other:QuestReward(e.self,0,math.random(8),math.random(0,3),0,eq.ChooseRandom(13006,13007,13016,13018,17001),200); --Water Flask, Ration, Bottle of Kalish, Short Ale, Wrist Pouch
	else
		item_lib.return_items(e.self, e.other, e.trade); -- return unused items
	end
end
 --END of FILE Zone:rivervale  ID:19086 -- Fiddy_Bobick
