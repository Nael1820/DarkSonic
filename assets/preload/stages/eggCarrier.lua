local xx = 425.59
local yy = 400
local xx2 = 986.95
local yy2 = 450
local ofs = 50
local followchars = true
local fuckfuckfuck = false

function onCreate()
	triggerEvent('Camera Follow Pos','','')
	
	makeLuaSprite('sky', 'unleashed/darksonicbgsky', -1000, -700)
	setScrollFactor('sky', 0.5, 0.5)
	scaleObject('sky', 2.0, 2.0)
	
	makeLuaSprite('ships', 'unleashed/darksonicbgships', -1000, -700)
	scaleObject('ships', 2.0, 2.0)
	
	makeLuaSprite('floor', 'unleashed/darksonicbgground', -1000, -700)
	scaleObject('floor', 2.0, 2.0)
	
	makeLuaSprite('void', nil, -700, -500)
	makeGraphic('void', 4000, 3000, '000000')
	setProperty('void.alpha', 0)

	addLuaSprite('sky', false)
	addLuaSprite('ships', false)
	addLuaSprite('floor', false)
	addLuaSprite('void', false)
end

function onUpdate(elapsed)

	if getProperty("health") > 0.0182 and fuckfuckfuck == true then
		setProperty("health", getProperty("health") - 0.0182)
	end

	--oh shit he floats
	if curStep >= 0 then
    songPos = getSongPosition()

    local currentBeat = (songPos/1000)*(bpm/80)

    doTweenY('hrrk', 'dad', 180-50*math.sin((currentBeat*0.15)*math.pi),0.01)
	doTweenY('hrrg', 'ships', -700-110*math.sin((currentBeat*0.2)*math.pi),0.05)
	
	end
	
	--Follow Cam Stuff LMAO
     if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
	else
        triggerEvent('Camera Follow Pos','','')
	end
end

function onEvent(name,value1,value2)

    if name == "Set Cam Zoom" then
        followchars = false
		triggerEvent('Camera Follow Pos',1000,600)
    end
	if name == "Cam Boom Speed" then
        followchars = true
		triggerEvent('Camera Follow Pos','','')
    end
	if name == "Set Cam BF" then
        eks = tonumber(value1)
		wye = tonumber(value2)
		
		xx2 = eks
		yy2 = wye
    end
	if name == "Duet" then
        goofyaah = tonumber(value1)
		whoopee = tonumber(value2)
		
		cameraFlash('camHUD', 'FFFFFF', 0.3, false)
		doTweenAlpha('eh1', 'timeBar', goofyaah, whoopee, 'linear')
		doTweenAlpha('eh2', 'healthBar', goofyaah, whoopee, 'linear')
		doTweenAlpha('eh3', 'iconP1', goofyaah, whoopee, 'linear')
		doTweenAlpha('eh4', 'iconP2', goofyaah, whoopee, 'linear')
		doTweenAlpha('eh5', 'timeTxt', goofyaah, whoopee, 'linear')
		doTweenAlpha('eh6', 'scoreTxt', goofyaah, whoopee, 'linear')
		doTweenAlpha('geef', 'gf', goofyaah, whoopee, 'linear')
		
		if goofyaah == 0 then
			xx = 750
			yy = 470
			xx2 = 750
			yy2 = 470
			doTweenAlpha('voyd', 'void', 1, 0.3, 'linear')
			fuckfuckfuck = true
		elseif goofyaah == 1 then
			xx = 425.59
			yy = 400
			xx2 = 986.95
			yy2 = 450
			doTweenAlpha('voyed', 'void', 0, 0.3, 'linear')
			fuckfuckfuck = false
		end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) --goofy ahh health drain
	if getProperty("health") > 0.0182 then
			setProperty("health", getProperty("health") - 0.0182)
	end
end