--HONK mod for teardown by KillerKat on Github
--V 1.2
	
	honk = {LoadSound("MOD/snd/honk1.ogg"),LoadSound("MOD/snd/honk2.ogg"),LoadSound("MOD/snd/honk3.ogg"),LoadSound("MOD/snd/honk4.ogg")}
	readyDefault = 0.40 --time between HONKS
	ready = readyDefault
	frame = "honk" .. math.random(1,4) .. ".png"
	prev = 0
    honkPower = GetFloat("savegame.mod.honkpower")
	if honkPower == 0 then honkPower = 3 end

function tick(dt)

	
	if InputDown("h") then
	 if (ready >= readyDefault) then
				PlaySound(honk[math.random(1,4)],GetPlayerPos(),4.0)
				
				MakeHole(lookpos(), math.random(0.1, honkPower), math.random(0.1, honkPower), math.random(0.1, honkPower)) --Change these to change how large the damage is (Or use the options slider)
				ready = 0 
			end
	end
	if (ready < readyDefault) then
			ready = ready + dt
			prev = prev + dt
		end
end
--NO idea how this works
function lookpos()
  local t = GetCameraTransform()
  local transform = TransformToParentVec(t, Vec(0, 0, -1))
  hit, dist, normal, shape = QueryRaycast(t.pos, transform, 400)
  if hit then
      local pos = VecAdd(t.pos, VecScale(transform, dist))
      return pos
    else
      return false
    end
end