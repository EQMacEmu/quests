function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you. This is a dangerous forest for adventuring. Watch out for the [beasts of these woods].");
	elseif(e.message:findi("beast")) then
		e.self:Say("These lands are most abundant in poisonous creatures. Watch your step. I have even heard tales of some seeing the dreaded [plague dragon], but I believe that to be sheer myth.");
	elseif(e.message:findi("dragon")) then
		e.self:Say("Like I told you, that is sheer myth. A great dragon whose breath can rot the flesh from your body in seconds?! Pfaw! This is surely another tale told by senile old men. Ha!!");
	elseif(e.message:findi("heretic")) then
		e.self:Say("Heretics!! Thank Quellious the High Guard Sentinels are around to keep us safe from those evildoers!");	
	elseif(e.message:findi("prisoner")) then
		e.self:Say("There was an escaped prisoner named E'lial B'roon. He was supposed to be a crafty heretic from what I hear. Thank Quellious I have not met up with such an evil man. I shall watch my back for suspicious men such as that [magician in the forest].");		
	elseif(e.message:findi("magician")) then
		e.self:Say("There is a magician running around on the other side of the stream.  I know because from time to time he comes to the stream.  He never fishes or gets water, he just stands there as he is if waiting for something.  He dropped something, a tunic.  Can you [return  the tunic] to him?");		
	elseif(e.message:findi("tunic")) then
		e.self:Say("Oh, good.  Be careful!  He may be the heretic escapee.");
		e.other:SummonCursorItem(18830); -- this is a placeholder item, should be "Tunic" that ID's as "Stained Tunic"
	end
end