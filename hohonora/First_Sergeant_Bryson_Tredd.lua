local SAY_TEXT = {
	"Allright, men, break it up, and fall in!",
	"Listen up, soldiers! I have some important news for all of us. You may have noticed that in the recent times, that small sections of our battalion have been leaving these halls. You may have further noticed that most of the remaining troupes have started some special training here within the halls.",
	"It has come down from the Captains of the platoon that we are to also begin training. We will be training in advanced combat tactics. The reason for this is that while half of the battalion is out on the march, and engaging in battle, we are to protect the Halls. In addition to protecting the halls, it is entirely possible that we may be called into battle.",
	"If our platoons are called into battle, that will mean only one thing. The traditional means of fighting are not faring well on the battlefield. This is the reasoning behind all the special operations training that the squads are undergoing. We are preparing for the worst. We are preparing you guys to go into a battle that is being lost, and turn it around. Failure is not an option.",
	"It is your duty to not only learn these skills, but to make them second nature. I don't want you to think about what you are going to do when the enemy is baring down on your position, and there are only three of you, hiding in a small patch of dense forest. It will be instinct. You will have acted, and defeated the enemy before you even had a chance to think about what you were going to do. You are our secret weapons.",
	"Is this clear, soldiers?",
	"Are all of you ready to begin your training?",
	"Excellent! You two, take your positions over there!",
	"And you two, take your positions over here. On my mark, you will begin sparring, and I will make suggestions to you based upon what I see in your fighting styles.",
	"Mark!",
};

local n;

function SendSignals(n)
	eq.signal(211041, n); -- Atlaar_Mignar
	eq.signal(211039, n); -- Mildar_Gormrok
	eq.signal(211040, n); -- Ranndall_Darknon
	eq.signal(211038, n); -- Eldon_Starkorp
end

function event_spawn(e)
	eq.set_timer("say", 10000);
	n = 0;
end

function event_timer(e)

	if ( e.self:IsEngaged() or e.self:GetX() ~= e.self:GetSpawnPointX() or e.self:GetY() ~= e.self:GetSpawnPointY() ) then
		return;
	end

	n = n + 1;
	
	if ( n == 1 ) then
		eq.set_timer(e.timer, 15000);
	elseif ( n == 9 ) then
		eq.set_timer(e.timer, 25000);
	elseif ( n == 10 ) then
		eq.set_timer(e.timer, 25*60000);
	end

	e.self:Say(SAY_TEXT[n]);
	
	if ( n == 1 ) then
		SendSignals(1);
		
	elseif ( n == 6 or n == 7 ) then
		SendSignals(3);
		
	elseif ( n == 8 ) then
		SendSignals(2);
		
	elseif ( n == 9 ) then
		SendSignals(4);
		
	elseif ( n == 10 ) then
		SendSignals(5);
		n = 0;
	end
end
