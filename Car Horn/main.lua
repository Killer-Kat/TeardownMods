--Car horn mod for teardown by KillerKat on Github
--Credit to the Honk mod for a lot of the code, I found it when I was checking to see if there was already a car horn mod. Most of what I needed was already there I just needed to change from goose honks to car honks and check if the player is in a car instead of if they have the honk gun.
function init()
	
	--honk = {LoadSound("MOD/snd/honk1.ogg"),LoadSound("MOD/snd/honk2.ogg"),LoadSound("MOD/snd/honk3.ogg"),LoadSound("MOD/snd/honk4.ogg")}
	honk = {LoadSound("MOD/snd/BikeHorn.ogg")}
	readyDefault = 1 --time between HONKS
	ready = readyDefault
	prev = 0
end
	
function tick(dt)

	local v = GetPlayerVehicle() --Checks if the player is in a Vehicle
	if v ~= 0 and InputDown("c") then
	 if (ready >= readyDefault) then
				--PlaySound(honk[math.random(1,4)],GetPlayerPos(),4.0)
				PlaySound(honk[1],GetPlayerPos(),4.0)
				ready = 0 
			end
	end
	if (ready < readyDefault) then
			ready = ready + dt
			prev = prev + dt
		end
end
