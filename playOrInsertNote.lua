-- @noindex
local workingDirectory = reaper.GetResourcePath() .. "/Scripts/DrumsGun"
require(reaper.GetResourcePath() .. "/Scripts/ChordGun/midiMessages")
require(reaper.GetResourcePath() .. "/Scripts/ChordGun/preferences")
require(reaper.GetResourcePath() .. "/Scripts/ChordGun/insertMidiNote")

local function playNote(noteValue)

  stopNotesThatArePlayingOnChannelOne()
  playMidiNote(noteValue)
  setNotesThatArePlayingOnChannelOne({noteValue})
end

function insertNote(noteValue)

	insertMidiNote(noteValue, false)
	moveCursor()
end

function playOrInsertNote(noteValue, actionDescription)

  if activeTake() ~= nil and notCurrentlyRecording() then

  	startUndoBlock()
    insertNote(noteValue)
		endUndoBlock(actionDescription)
  end

	playNote(noteValue)
end