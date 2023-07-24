function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("considers you for a moment.  Your jaw seems to ache from having to say such a horrible name.  The gnome pulls out a book and flips through each page, making sure not to wrinkle the paper.  Finally he stops on one and glances up at you as he reads.  'Ahoy there me matey.  Shiver me biscuits and hoist the bloomers.'  He puts away the book and looks up at you.  'Ritual greetings and all.  Have to stick to protocol.  Nice to meet you.  I'm the magics advisor here.'");
	elseif(e.message:findi("magic.* advisor")) then
		e.self:Say("Yes.  All things magical and mystical, that's my specialty.  I'm not one of the original members of this 'quaint' encampment but I find myself amused by things here.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110069)) then
			eq.get_entity_list():GetMobByNpcTypeID(110069):Say("Hey!  Don't think I'm not knowin' what's comin' outta that porthole of yers just cause ya use fancy words!  We ain't quaint, we're big, mean, and most of all, we're pirates.  Arrr!");
			e.self:Say("Erm.  Arrrr.  Aye, aye, skipper.");
		end
	elseif(e.message:findi("original member")) then
		e.self:Emote("takes a deep breath and stares at the ceiling as if remembering a sentence long practiced and used.  'I only heard about this place recently so I thought I'd drop by and explore a bit for magics and I did but after awhile I met Captain Nalot and he told me that if I wanted I could have part of the magical 'booty' so I said yes and now I take care of all the new artifacts that are found which isn't really many because we're stuck on the coast so mostly I just sell scrolls.' Xorbin finishes and starts to wheeze, catching his breath.");
	elseif(e.message:findi("scroll")) then
		e.self:Say("Yes, yes.  Scrolls are my specialty!  I was surprised at how many magics I found in this land.  Not all ice-based either.  I've spent many months searching across this unexplored wasteland learning new magics from everywhere I could.  Because of this I am now able to present you, Marvn, with the once in a lifetime, never see it again, no money back so keep your hands away from the fizzle,  half as good but twice the price scroll collection.  If you want some just browse my selection.  They're good stuff, really.");
	end
end
