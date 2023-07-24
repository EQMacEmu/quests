function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("peers at you with glazed eyes from beneath heavy eyelids. 'You do not seem to be near death. If you have come to the [Ultricle] to salvage from the dead like a scavenger wolf then go about your business and leave me to suffer.");
	elseif(e.message:findi("ultricle")) then
		e.self:Say("This place marked by the stone with the blood red rune is The Ultricle, the place where the sick, weak, dying and dead Teir'Dal that have not earned a noble death are left to rot. The evil magics that are spreading Innoruuk's corruption through the Nektulos Forest have been growing stronger lately and both the [recent and long dead] have been rising from their shallow graves.");
	elseif(e.message:findi("dead")) then
		e.self:Say("Most of the dead that rises here is Teir`Dal as would be expected, but there are undead creatures that burrow from deep within this soil that are human dead from a time before we Teir`Dal emerged into the Nektulos from the underfoot of Norrath. Neither the Teir`Dal nor the Human dead that rises here attacks me or the others that are barely clinging onto life, perhaps it is because they sense we will soon be joining them in death.");
	end
end
