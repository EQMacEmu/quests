function event_say(e)
	if(e.message:findi("healer")) then
		e.self:Say("You have a ooch?  No show me.  Make me sick.  Go see Greenblood Shaman in caves.  They fix you.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("Me warrior!  When me young me go to Crakneks and train.  Crakneks way back.  Through caves.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("Need stuff?  Go find Erung and Cronga in caves or Angrog in stone box wit holes.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Go by Crakneks.  You find Ungral.  He keep stuff.  Me think he give it back.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Armer?  Hmmm...  Me know!  Go to way back of Oggok.  In cave you find Metl Armer and Lether Armer.  Huh!  Them dumb.  Them no know armer start wit 'R'.  Huhu!  Dumb.");
	elseif(e.message:findi("bouncers")) then
		e.self:Say("Me Bouncer!  Me best smasher.  Bouncers smash for Oggok.  Clurg make us and he our boss.");
	elseif(e.message:findi("craknek")) then
		e.self:Say("Crakneks warriors!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
	elseif(e.message:findi("leader") or e.message:findi("king")) then
		e.self:Say("Zulort strongest.  Him big shaman.");
	elseif(e.message:findi("inn") or e.message:findi("rest") or e.message:findi("sleep")) then
		e.self:Say("Huh?  You sleep in cave.  Rest there.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("You get wepuns from Cikoona.  She have shop not cave.  In cave you find smash wepuns.  Rora have smashies.");
	elseif(e.message:findi("chef") or e.message:findi("dooga")) then
		e.self:Say("Chef Dooga good cooker.  She make good HEHE meat.  She give coin fer meat to cook with.  She cook at Clurg's by Crakneks.");
	end
end