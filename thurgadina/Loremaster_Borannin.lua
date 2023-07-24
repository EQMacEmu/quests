-- prayer shawl quests

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ", please be seated and hear the Grand Historian, he is among the wisest of our people.");
	elseif(e.message:findi("for the crown")) then
		e.self:Say("Those eager to prove their loyalty to the Dain may do so by completing tasks that I have been commissioned to assign. If you wish to begin your service, return to me with four toes of our enemy, the Kromrif.");
	elseif(e.message:findi("task")) then
		e.self:Say("Every year the Dain replaces the trophies in his trophy room. There is a reward given for the best new trophy obtained. I intend to win this year and I will upgrade your prayer shawl for assisting me. Fill this box with ten Kromrif heads and bring me the combined contents along with the burlap shawl. I will submit the best one for the Dain's consideration.");
		e.other:SummonCursorItem(17102); -- Item: Preservationists Box
	elseif(e.message:findi("chore")) then
		e.self:Say("The council agrees that you have demonstrated a disdain for our enemy, the Kromrif, that rivals our own. They now ask that you demonstrate your loyalty to the Dain by humbling yourself and serving our people. Give this, my seal, to Mordin. He will instruct you further.");
		e.other:SummonCursorItem(1420); -- Item: Borannin's Seal
	elseif(e.message:findi("brewing")) then
		e.self:Say("Ahh yes, good to see you again, " .. e.other:GetCleanName() .. ". I wish it were under better circumstances that we meet today. For some time now we have sent teams of our finest rogues to gather intelligence for the Dain. Tanik Greskil is one of our best. He was recently sent into the heart of Kael Drakkel on a very important mission and has not returned. He is now long overdue, and fearing the worst, our wise council has asked me to dispatch a rescue party to determine what has become of him and return him to safety. I have decided to give you this opportunity to build upon the trust you have earned from the council. Will you accept this mission?");
	elseif(e.message:findi("accept this mission")) then
		e.self:Say("The council will be pleased to hear of your acceptance. Scour the regions surrounding the city of the Giants. Discover what happened to Tanik and, if possible, return him to Thurgadin. If you are successful, remember to hand me your woven shawl. We seem to be running low on them, but I must say Mordin has never had so much help in the kitchen. Anyway, I will eagerly await word of your findings. Good luck, and may Brell protect you.");
	elseif(e.message:findi("advance my reputation")) then
		e.self:Say("" .. e.other:GetCleanName() .. "! Thank Brell you're here. I was about to send one of my Lorekeepers looking for you. It appears that the information Tanik acquired is most perilous indeed. The Dain has called an emergency session of the council and I must attend. We don't have the luxury of waiting for an appropriate task to arise, you must advance as soon as possible. Unfortunately, I have neither the time, nor the components to fashion the next few shawls for you. Ask Rexx Frostweaver about the prayer shawl and follow his direction carefully.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1199}, 0)) then
		e.self:Say("Incredible! Never before has an outlander been skilled and determined enough to craft our sacred rune. You are now worthy of the Dain's most perilous task. You should seek an audience with the Dain immediately. Show him your Runed Prayer Shawl; he will give you the task that has been prepared for you. If the Dain is away show your Shawl to Chamberlain Krystorf and he will call for him.");
		e.other:QuestReward(e.self,0,0,0,0,1199);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29125,item2 = 29125,item3 = 29125,item4 = 29125}, 0)) then -- 4 frost giant toes
		e.self:Say("Ahh, well done! On behalf of the Dain I thank you for making a dent in the number of our sworn enemy. Please accept this as a token of our appreciation. It is trivial, I know, but if you are as loyal as you claim to be, it will increase in power over time. It just so happens I have a [task] to further demonstrate your loyalty, " .. e.other:GetCleanName() .. ".");
		ColdainFaction(e);
		e.other:QuestReward(e.self,0,0,0,0,1175,10000); -- xp reward verified from live packet
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1175,item2 = 1174})) then -- burlap shawl and preserved kromrif heads
		e.self:Say("Ahh, some fine specimens indeed, " .. e.other:GetCleanName() .. ". I will have the best of these mounted at once, wish me luck in the contest! Here is the Cloth Prayer Shawl of our people. Before I forget, the council has issued yet another [chore] for you to complete.");
		ColdainFaction(e);
		e.other:QuestReward(e.self,0,0,0,0,1176,25000); -- xp reward verified from live packet
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1176,item2 = 1422})) then -- thoridains seal and cloth shawl
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ", the council will be impressed with your effort. Here is the woven prayer shawl, wear it with pride. I know there is talk of great plans for you, be sure to come back and ask me what the council has [brewing].");
		ColdainFaction(e);
		e.other:QuestReward(e.self,{items = {1422,1177},exp = 50000}); -- Item: Seal of Thoridain
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1177,item2 = 1560})) then -- tanik's note and woven shawl
		e.self:Say("Words cannot express our gratitude for your deeds outlander, you have saved a hero of our people from certain death. Please accept this, the Fur-lined shawl, as a token of our sincere appreciation. You are indeed among the most highly regarded " .. e.other:Race() .. "s to set foot in Thurgadin. The next time we meet be sure to ask me how to further advance your reputation with the coldain.");
		e.other:Faction(e.self,406,20); -- coldain
		e.other:Faction(e.self,405,5); -- dain
		e.other:Faction(e.self,448,-2); -- kzek
		e.other:Faction(e.self,419,-10); -- krif
		e.other:QuestReward(e.self,0,0,0,0,1178,100000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function ColdainFaction(e)
	e.other:Faction(e.self,406,10); -- coldain
	e.other:Faction(e.self,405,2); -- dain
	e.other:Faction(e.self,448,-1); -- kzek
	e.other:Faction(e.self,419,-5); -- krif
end
