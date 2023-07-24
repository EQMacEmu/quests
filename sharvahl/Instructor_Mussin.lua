local count;
function event_spawn(e)
	count = 0;
	eq.set_timer("training",10000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		eq.signal(155310,1,1);
		eq.signal(155309,1,1);
		eq.signal(155308,1,1);
		e.self:Say("There are several routes available to you as a citizen of Shar Vahl. All citizens are expected to actively participate in the maintenance of our security.");
	end
	if(count==2) then
		e.self:Say("If you have a professional preference, please feel free to explore that area. You are just here to learn the basics of combat and survival.");
	end
	if(count==3) then
		e.self:Say("You'll learn soon enough. There are more than a few dangers beyond these walls. Combat is far from pleasant, but never something to fear. Vah watches over us all.");
	end
	if(count==4) then
		e.self:Say("All right students, before we hand you a set of practice weapons and allow you to unleash your youthful fury on each other, I will run through a series of attacks with you. Proper form is very important and can be attained through both armed and unarmed practice.");
	end
	if(count==5) then
		e.self:Say("You may want to watch this demonstration carefully, because I am going to see how well you paid attention in a few moments. I'd rather find out that you are unable to think and move at the same time now... rather than after one of those grunts down in the pit cracks your furry little skull open. Eyes on me, Recruits!");
	end
	if(count==6) then
		e.self:Say("This first move is a simple kick. If you are planning on becoming a Khala Dun or Khati Sha, you'd better get familiar with this move. The kick complements any series of attacks and can come in quite handy as a means of knocking an enemy off their guard or distracting them for a moment.");
		e.self:DoAnim(1); --kick
	end
	if(count==7) then
		e.self:Say("The bash is another standard Khala Dun Technique. You will need to use your center of balance and leverage to exert as much force into your enemy as possible. The weight of your body bashing into the enemy will usually leave them off balance and dazed for a few moments. That time should be more than enough for you to stage a secondary attack.");
		e.self:DoAnim(7); --bash
	end
	if(count==8) then
		e.self:Say("Next, the Taruun stab technique! This move isn't just for our shadow stalking citizens. Almost everyone should keep this move well practiced and ready!");
		e.self:DoAnim(2); --pierce
	end
	if(count==9) then
		e.self:Say("This move works if you are using a staff, spear, or some other form of polearm. You can disable your enemy, by quickly thrusting your weapon into their abdomen. It usually takes the wind right out of them.");
		e.self:DoAnim(4); --2hblunt
	end
	if(count==10) then
		e.self:Say("The two-handed overhead slash! Your enemy's skull will never be the same after the successful completion of this move! Be warned this technique is much slower than many of the others available to you and can leave you open to swift counter attacks.");
		e.self:DoAnim(3); --2hslash
	end
	if(count==11) then
		e.self:Say("The single-handed overhead swing is a common maneuver and should be practiced to perfection. Watch the way I distribute my weight and move my upper body. You should keep your head up and your eyes focused during every swing. Even with a simple move such as this.");
		e.self:DoAnim(5); --mainhand
	end
	if(count==12) then
		e.self:Say("Okay, now go over those moves for a moment and prepare to show me what you have learned.");
		eq.set_timer("training",30000);
	end
	if(count==13) then
		e.self:Say("Please stand and prepare to demonstrate the attacks as I call them out. I understand that your form will be a little sloppy, but that is what practice is for. Will will keep practicing these moves until you can show me that you can be trusted to not injure yourselves with the wooden practice weapons.");
		eq.signal(155310,2,1);
		eq.signal(155309,2,1);
		eq.signal(155308,2,1);
		eq.set_timer("training",5000);
	end
	if(count==14) then
		e.self:Say("First move... the Kick! Attack!");
		eq.signal(155310,3,1);
		eq.signal(155309,3,1);
		eq.signal(155308,3,1);
		e.self:DoAnim(51); --clap
	end
	if(count==15) then
		e.self:Say("Now... the Bash! Attack!");
		eq.signal(155310,4,1);
		eq.signal(155309,4,1);
		eq.signal(155308,4,1);
		e.self:DoAnim(51); --clap
	end
	if(count==16) then
		e.self:Say("Next... the One-handed Stab! Attack!");
		eq.signal(155310,5,1);
		eq.signal(155309,5,1);
		eq.signal(155308,5,1);
		e.self:DoAnim(51); --clap
	end
	if(count==17) then
		e.self:Say("Arlight... Two-handed thrust! Attack!");
		eq.signal(155310,6,1);
		eq.signal(155309,6,1);
		eq.signal(155308,6,1);
		e.self:DoAnim(51); --clap
	end
	if(count==18) then
		e.self:Say("Now... smash with both hands! Attack!");
		eq.signal(155310,7,1);
		eq.signal(155309,7,1);
		eq.signal(155308,7,1);
		e.self:DoAnim(51); --clap
	end
	if(count==19) then
		e.self:Say("Okay...the One-handed swing! Attack!");
		eq.signal(155310,8,1);
		eq.signal(155309,8,1);
		eq.signal(155308,8,1);
		e.self:DoAnim(51); --clap
	end
	if(count==20) then
		e.self:Say("Go ahead and take a seat. As a whole you looked very good. Take a break and we will get ready to go through it again.");
		eq.signal(155310,9,1);
		eq.signal(155309,9,1);
		eq.signal(155308,9,1);
		eq.set_timer("training",90000);
	end
	if(count==21) then
		count = 0;
		eq.set_timer("training",10000);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
