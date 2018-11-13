function clearConsoleWindow()
  reaper.ShowConsoleMsg("")
end

function print(arg)
  reaper.ShowConsoleMsg(tostring(arg) .. "\n")
end

function getTrack(trackNameArg)

  local activeProjectIndex = 0
  local numberOfTracks = reaper.CountTracks(activeProjectIndex)

  for i = 0, numberOfTracks - 1 do

    local track = reaper.GetTrack(activeProjectIndex, i)
    local _, trackName = reaper.GetTrackName(track, "")

    if trackName == trackNameArg then
    	return track
    end
  end

  return nil
end

function getNotes(arg)

	local notes = {}

	local activeProjectIndex = 0
	local drumsTrack = getTrack("drums")
	local allChannels = -1

	for i = 0, 127 do

		local noteName = reaper.GetTrackMIDINoteNameEx(activeProjectIndex, drumsTrack, i, allChannels)

		if noteName ~= nil and string.match(noteName, arg) then
			table.insert(notes, i)
		end
	end

	return notes
end

function startUndoBlock()
	reaper.Undo_BeginBlock()
end

function endUndoBlock(actionDescription)
	reaper.Undo_OnStateChange(actionDescription)
	reaper.Undo_EndBlock(actionDescription, -1)
end

function emptyFunctionToPreventAutomaticCreationOfUndoPoint()
end
