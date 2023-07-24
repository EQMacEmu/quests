function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Bah!!  A powerful knight such as myself confined to a post!  My heart yearns for battle.  I yearn to return to the [tunnels beneath] and face evil once again!");
	elseif(e.message:findi("tunnels beneath")) then
		e.self:Say("Aye!!  The tunnels beneath the land.  The location escapes me, but I do remember the evil beasts within!!  Slime and even [madmen] from the races of Antonica.  Hah!!  What am I saying?  That is all that inhabits Antonica!");
	elseif(e.message:findi("madmen")) then
		e.self:Say("Madmen, indeed!  I must admit that I even saw a few of my own among their numbers.  They fought with no fear.  They fell before our swords.  Some carried weapons the likes of which I have never seen. I myself own a [trophy] from that battle.");
	elseif(e.message:findi("trophy")) then
		e.self:Say("My trophy from the tunnels is some sort of baton.  I cannot seem to get the hang of wielding it.  A monk once showed me the proper way to use it, but I quickly dismissed him.  Hah!!  I need not take instructions from men who do not understand the beauty of the blade.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end