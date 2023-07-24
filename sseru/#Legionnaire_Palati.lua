function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have too much on my mind to make chitchat, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("mind")) then
		e.self:Say("If you really must know, I am worried about my brother.");
	elseif(e.message:findi("brother")) then
		e.self:Say("My older brother Yill.  He's a Praetorian, a fine fine soldier who was promoted from the Legion to Seru's personal guard.  He has been doing that for years now.  But he just had his Question a few weeks back, and since then, he has not been the same.  This was his tenth Question.  I have been through eight myself, they are rough at times, but it is for the good of the city.  You can fail and are cast out, die in the process, or you pass and go on with your life.  But what happened to Yill is different.");
	elseif(e.message:findi("where.* tavern")) then
		e.self:Say("There are four taverns in Sanctus Seru.  The Red Eye, The Full Hand, The Unburdened Shoulders, and The Glad Heart.  One for the members of each Praesertum.");
	elseif(e.message:findi("where.* shop")) then
		e.self:Say("There are many fine shops in Sanctus Seru.  I suggest you browse them for yourselves.");
	elseif(e.message:findi("where.* quest")) then
		e.self:Say("Why surely, a city of this size will have many tasks for you to accomplish!  That is, once the builders get around to it.  Check back late in the summer or early in the fall, there should be much for you to do then.");
	elseif(e.message:findi("where.* leader") or e.message:findi("who.* leader")) then
		e.self:Say("Sanctus Seru is controlled by the four Praesertum, The Hand, The Eye, The Heart, and The Shoulders.  Each Praesertum has their own responsibilities.");
	elseif(e.message:findi("leave")) then
		e.self:Say("If you wish to leave the city, you must first pass by the Vigulum.  If they do not stop you, you are free to go.");
	elseif(e.message:findi("lewt") or e.message:findi("loot")) then
		e.self:Say("Have you visited the Plane of Growth lately?");
	elseif(e.message:findi("what.* question")) then
		e.self:Say("The Question is what keeps us pure. Every two years, each citizen of Seru must submit to the Question. You can refuse the question, but then you are cast out of the city, one of The Recuso. Those that submit spend three days in the care of another Praesertum. If you are pure of thought and deed, you have nothing to worry about. If you are not pure, you can be cast out.");
	elseif(e.message:findi("who.* seru")) then
		e.self:Say("Seru is the genius behind the Combine Empire. A man of unfailing honor and honesty, he devised the Inquisition, to root out unclean elements in the Empire. His saddest day was when he discovered that Katta himself was a traitor. When confronted with proof of his treachery, Katta feigned his own murder, and fled to Luclin. Seru had no choice but to amass an expedition and follow after him.");
	elseif(e.message:findi("who.* katta")) then
		e.self:Emote("spits on the ground. Katta, bah! Betrayer and destroyer of the Combine! I curse his name, curse his name, thrice curse his name!");
	elseif(e.message:findi("caravan")) then
		e.self:Say("We run many caravans to and from Shadow Haven. As much as we dislike dealing with that unsavory lot, we find ourselves needing supplies only they can provide at the moment. Since they are not fond of coming out of their hole in the earth, we provide them with raw materials from the Lightside in return.");
	elseif(e.message:findi("arena")) then
		e.self:Say("We have a fine coliseum here in Sanctus Seru. Many glorious events are held there throughout the year, from plays to races, to gladiator games. It can be found at the far south of the city.");
	elseif(e.message:findi("suck")) then
		e.self:Say("I know you do, but what about us?");
	elseif(e.message:findi("you.* suck")) then
		e.self:Say("Verily, methInks YOU doth sucketh much more than I, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("mind")) then
		e.self:Say("If you really must know, I am worried about my brother.");
	elseif(e.message:findi("praesertum")) then
		e.self:Say("The four Praesertum can be found in the center of the city. Each has their own building, easily identified by the symbol above the main entrance. Stay clear of the Arx Seru, the central building. This is the resting place of Seru, who does not allow anyone but the Praesertum to disturb him. To venture inside is death for all that are not invited.");
	elseif(e.message:findi("what.* eye")) then
		e.self:Say("The Eye keeps us informed of all that goes on beyond the walls. They are responsible for security and purity inside the walls as well. They also monitor the other three Praesertum.");
	elseif(e.message:findi("what.* heart")) then
		e.self:Say("The Heart is in charge of all things administrative. From collecting taxes to issuing swords, to making sure each citizen knows when it is time for the Question.");
	elseif(e.message:findi("rogue guild")) then
		e.self:Say("Um, er, I think you might want to visit either The Hand, The Eye, or The Shoulders. And stop looking at my purse.");
	elseif(e.message:findi("druid guild") or e.message:findi("shaman guild")) then
		e.self:Say("We have no primitives in our city. You might find them among the slovenly merchants in Fordel Midst. And I know there are some of them hiding in the foul Loyalist city.");
	elseif(e.message:findi("necromancer guild")) then
		e.self:Say("Do not speak to me of such foulness. It was evil of that nature that brought the Combine together in the first place. You will find nobody of that ilk here!");	
	elseif(e.message:findi("monk guild")) then
		e.self:Say("Check with The Eye. Their Manstoppers are all of that profession.");
	elseif(e.message:findi("shadowknight guild")) then
		e.self:Say("Perversions such as that are not welcome here.");
	elseif(e.message:findi("ranger guild")) then
		e.self:Say("The Hand and The Eye both employ Rangers.  Check with them.");
	elseif(e.message:findi("cleric guild")) then
		e.self:Say("All four Praesertum have Clerics in their ranks.");
	elseif(e.message:findi("magician guild")) then
		e.self:Say("Well, lets see.  I know The Heart and The Shoulders have Magicians that work for them.  I would check there first.");
	elseif(e.message:findi("enchanter guild")) then
		e.self:Say("The Eye and The Heart have Enchanters.");
	elseif(e.message:findi("wizard guild")) then
		e.self:Say("All four Praesertum have Wizards in their employ, I'm sure you can find one that will be able to assist you.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("There is a warrior guildmaster in every Praesertum building.  Perhaps one would be willing to train you.");		
	end
end
