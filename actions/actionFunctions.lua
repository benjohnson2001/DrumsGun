local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumsGun"
require(workingDirectory .. "/preferences")
require(workingDirectory .. "/util")
require(workingDirectory .. "/playOrInsertNote")


function playOrInsertKickNote()

	local notes = getNotes("kick")
	local kickIndex = getKickIndex()

	playOrInsertNote(notes[kickIndex], "kick note")
end

function playOrInsertSnareNote()

	local notes = getNotes("snare")
	local snareIndex = getSnareIndex()

	playOrInsertNote(notes[snareIndex], "snare note")
end

function playOrInsertHihatNote()

	local notes = getNotes("hihat")
	local hihatIndex = getHihatIndex()

	playOrInsertNote(notes[hihatIndex], "hihat note")
end

function playOrInsertRideNote()

	local notes = getNotes("ride")
	local rideIndex = getRideIndex()

	playOrInsertNote(notes[rideIndex], "ride note")
end


function cycleKick()

	local kickIndex = getKickIndex()
	local numberOfKicks = getNumberOfKicks()

	if kickIndex + 1 > numberOfKicks then
		setKickIndex(1)
	else
		setKickIndex(kickIndex + 1)
	end
end

function cycleSnare()

	local snareIndex = getSnareIndex()
	local numberOfSnares = getNumberOfSnares()

	if snareIndex + 1 > numberOfSnares then
		setSnareIndex(1)
	else
		setSnareIndex(snareIndex + 1)
	end
end

function cycleHihat()

	local hihatIndex = getHihatIndex()
	local numberOfHihats = getNumberOfHihats()

	if hihatIndex + 1 > numberOfHihats then
		setHihatIndex(1)
	else
		setHihatIndex(hihatIndex + 1)
	end
end

function cycleRide()

	local rideIndex = getRideIndex()
	local numberOfRides = getNumberOfRides()

	if rideIndex + 1 > numberOfRides then
		setRideIndex(1)
	else
		setRideIndex(rideIndex + 1)
	end
end


function playOrInsertCrashNote()

	local notes = getNotes("crash")
	playOrInsertNote(notes[1], "crash note")
end

function playOrInsertChinaNote()

	local notes = getNotes("china")
	playOrInsertNote(notes[1], "china note")
end


function playOrInsertTom4Note()

	local notes = getNotes("tom4")
	playOrInsertNote(notes[1], "tom4 note")
end

function playOrInsertTom3Note()

	local notes = getNotes("tom3")
	playOrInsertNote(notes[1], "tom3 note")
end

function playOrInsertTom2Note()

	local notes = getNotes("tom2")
	playOrInsertNote(notes[1], "tom2 note")
end

function playOrInsertTom1Note()

	local notes = getNotes("tom1")
	playOrInsertNote(notes[1], "tom1 note")
end

