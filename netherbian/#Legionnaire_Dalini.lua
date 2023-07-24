-- Earring of Veracity #1 (Insignia)

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No loitering.");
	elseif(e.message:findi("bregun dorey")) then
		e.self:Say("Yeah maybe I know Bregun. You know, I sure am thirsty with all this guard work I am doing. I know what I want, some Dawnshroud Cider! Yeah, go fetch me a cider and we will see if I remember anything when you get back.");
	elseif(e.message:findi("trog")) then
		e.self:Say("The Trogs.  Troglodytes.  Cave Dwellers.  Stinky little things with big teeth that live in here.  Not to be confused with the Netherbians, who also stink, and have big teeth.  The Trogs are a nuisance more than anything else, they aren't organized enough to present a real threat to us.");
	elseif(e.message:findi("netherbian")) then
		e.self:Say("Ugh!  Nasty things.  No eyes.  Big teeth.  Eat anything, including each other.  They have been quiet for months now, but they were a real problem in the past.  We lost a lot of good men keeping this route free of them.  Lets hope they don't start acting up again.");
	elseif(e.message:findi("recuso")) then
		e.self:Say("Recuso.  The Refused.  They refused the Question, or failed it.  Any who refuse are cast out of Sanctus Seru, to fend for themselves.  We let them be, for the most part, as long as they don't try to steal from us.  But we are forbidden to give them aid in any way.  The closest thing to that you will see is us letting them \"sneak\" into here for shelter.  Though they soon find out, we did them no favors, for they have to earn that shelter. The one reason we let the Recuso live in here is because  they help keep the Netherbians and the Trogs in check.  No sense wasting good lives, when we can spend the Recuso, eh?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29851}, 0)) then -- dawnshroud cider
		e.self:Say("Dorey usually roams in the troglodyte caves, you might find him there.");
		eq.unique_spawn(161007,0,0,-365,-89,2.1,88); -- spawn Bregun Dorey.  Coordinate verifed by myseq
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
