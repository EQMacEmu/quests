function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail dere to you as well, " .. e.other:GetCleanName() .. ". Me name is Tronso Namistail. I am a carpenter in this here Shadowhaven and responsible for many of the fine structures that we have here. I have lived in this city for quite some time, and know me way around pretty well I would say. So I thought I would help out the new folks a bit. Are you a [newcomer] to the Haven?");
	elseif(e.message:findi("newcomer")) then
		e.self:Say("Ah excellent to hear dat. Well it sure is great to have ye here, we have many places to see and so many different merchants with such an assortment of goods that you are sure to find what ya need here or in the Bazaar. I can also give you a tour of the Haven if you would like to learn yer way around!");
	elseif(e.message:findi("take me on a tour") and e.self:GetX() == 371 and e.self:GetY() == -1007) then
		e.self:Say("Well den, lets git goin! First place we are off to is the Trade Commissioners. He is right around the corner from the gate and the reason I am going to take you to see him first is because it's very important that our newer guests register for trading.");
		eq.start(25);
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 7) then
		e.self:Say("Good to see you as always Commissioner!");
	elseif(e.wp == 14) then
		e.self:Say("Here we be at da Grimthor's Distillery, the biggest and most successful brewery of the Haven. Here you can fine the best of the best as far as ale goes. Many other bartenders of the Haven only sell drinks that are brewed here.");
	elseif(e.wp == 23) then
		e.self:Say("This is the entrance to the Bazaar. As many will tell you the Bazaar is the pride of the Shadowhaven. Within the Bazaar you will find numerous folks just like yourself looking to buy and sell goods of all kinds!");
	elseif(e.wp == 33) then
		e.self:Say("This is the path that leads to the Midst Quarter. In this area you will find some of the most powerful spellweavers in the land, as many of them are descendants of original settlers of our home that helped find our great city. Those that practice powerful magic will surely find sanctuary here.");
	elseif(e.wp == 40) then
		e.self:Say("This is the House of Fordel family residence. Here is where all of the nobles of our great city reside. Many that stay here are nobles either for service to the Shadowhaven or being a descendant of the original expeditionary unit.");
	elseif(e.wp == 58) then
		e.self:Say("And here we are at the finest division of the Haven indeed! The Short and Stout quarter of course here it is where I call me home. It's a city made for all likes of short folk. Although we feel sorry for those that are not rightsizers like us, they are all of course welcome to our home.");
	elseif(e.wp == 62) then
		e.self:Say("And here we have reached our final destination. This pad before us will teleport you to the Nexus. That about does it for the tour, I hope that everything I have showed ya will help you in your adventures. As for me, I'm going to head back near the front gate.");
	elseif(e.wp == 85) then
		eq.stop();
	end
end
