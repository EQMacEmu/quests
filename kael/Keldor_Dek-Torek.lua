function event_spawn(e)
	eq.set_timer("king",math.random(2700000,7500000));
	eq.set_timer("med",math.random(270000));
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Emote("continues to do what he was doing before you attemped to interrupt him.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_timer(e)
	if(e.timer == "med") then
		e.self:Emote(eq.ChooseRandom("'s eyes glow for a moment.","seems to be concentrating on a far off place.","whispers, 'Velketor... I know you are watching.'"));
		eq.set_timer("med",math.random(270000));
	end
	if(e.timer == "king") then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(113215)) then
			eq.stop_timer("med");
			eq.stop_timer("king")
			e.self:CastToNPC():AssignWaypoints(27);
		else
			eq.set_timer("king",math.random(2700000,7500000));
		end
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 11) then
		eq.zone_emote(0,"Keldor Dek`Torek says 'Greetings my lord.  I have been deep in meditation and have some news which you might find most interesting.'")
		eq.zone_emote(0,"King Tormax says 'What is it you have seen in your vision, Keldor?  Another vision of that old fool Yelinak?'")
	elseif(e.wp == 12) then
		eq.zone_emote(0,"Keldor Dek`Torek says 'Much worse my lord.  I watched you die with my own eyes.  At the hands of outlanders and dragons.  I fear that my old master is toying with my mind.'");
		eq.zone_emote(0,"King Tormax says 'That fool Velketor?  Get a hold of yourself, Keldor. Your magic is as strong as his and lord Rallos smiles upon you.  Now stop this nonsense of Velketor, he is more a threat to the Coldain than he is to me.  I cast him out of this city once and I could strike him down again if need be.'");
	elseif(e.wp == 13) then
		eq.zone_emote(0,"Keldor Dek`Torek says 'I pray my visions are false my lord.  I have seen other things though. . .  Things which worry me immensely.  The outlanders, they have begun to side themselves with Yelinak and that pitiful fool Dain Frostreaver.  Even some of the outlanders who worship Lord Zek have forsaken him.  I suggest that you have the temple of Lord Zek become more heavily protected.  The outlanders should not tread upon its holy ground.'");
		eq.zone_emote(0,"King Tormax says 'So it will be then.  The halls of the great temple of Rallos Zek shall not be walked by any other than the true children of Zek, the giants.  We will have to work harder to recruit outlanders into our service as well.  If we are to wipe the dragons from the face of Velious we will need hundreds of powerful mercenaries to fight along side us.'");
	elseif(e.wp == 14) then
		eq.zone_emote(0,"Keldor Dek`Torek says 'How shall we entice the outlanders into our service my lord?'");
		eq.zone_emote(0,"King Tormax says 'I shall have the smiths begin crafting great armor and weapons at a scale these outlanders can use.  Those who serve us well will be rewarded with these creations.  Keldor, begin crafting magical items the likes of which this realm has never seen to reward the sorcerers who will aid us.  Perhaps I will even grant a title to those who can help us reach our great goal!'");
	elseif(e.wp == 15) then
		eq.zone_emote(0,"Keldor Dek`Torek says 'I will begin at once my lord.  May Rallos smile upon us all.'");
		eq.zone_emote(0,"King Tormax says 'I am sure he will, faithful servant.'");
	elseif(e.wp == 29) then
		e.self:CastToNPC():StopWandering();
		eq.set_timer("med",math.random(270000));
		eq.set_timer("king",math.random(2700000,7500000));
	end
end
