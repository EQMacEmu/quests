function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("WHY, HELLO THAR, YOUNG LAD! GREAT DAY FER IT, AIN'T IT? YESSIREE! WHY THIS REMINDS ME O' THE DAYS BACK WHEN WE'D GATHER ROUND THE FIRE LIKE THIS AND.... OH. HELLO THAR, YOUNG LAD!  ER...  WHAT WAS I SAYIN'?");
	elseif(e.message:findi("day")) then
		e.self:Emote("speaks very loudly, as would one with a hearing problem common to one of great age. He shouts, 'EH?...WHAT'S THAT? YE GOTS TA SPEAK UP SOME, YOUNG " .. e.other:Race() .. "! I DON'T HEAR NONE TOO GOOD THESE DAYS! SO YE WANT TA HEAR ABOUT THE OL' DAYS, EH?! WELL BE SURE'N I'LL TELL YA! BRELL KNOWS I SEEN IT ALL! HAAHAAHAAAA!...hehehee...heh...huh?");
	elseif(e.message:findi("seen")) then
		e.self:Say("Ooohhh, yes, I've seen plenty. Back before we hid ourselves in the mountain, when we were without a home. They called it the War of Yesterwinter. Brave men fought and died. As we traveled across the wastes, we littered the land with cairns. The Kromrif and Kromzek also fell under our axes, but we were a race always running. Back then we were united in the cause of survival. Nowadays, these younguns... Ye never know.");
	end
end
