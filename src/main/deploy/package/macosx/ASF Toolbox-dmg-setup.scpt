tell application "Finder"
  tell disk "ASF Toolbox"
  open
    set current view of container window to icon view
    set toolbar visible of container window to false
    set statusbar visible of container window to false
    -- 600x400
    set the bounds of container window to {400, 100, 1000, 500}
    set _viewOptions to the icon view options of container window
    set arrangement of _viewOptions to not arranged
    set icon size of _viewOptions to 128
    set background picture of _viewOptions to file ".background:background.png"
    make new alias file at container window to POSIX file "/Applications" with properties {name: "Applications"}
    set _files to the name of every item of container window
    repeat with _file in _files
      set _path to POSIX Path of _file
      if _path is "/ASF Toolbox.app"
        set position of item _file of container window to {120, 160}
      else if _path is "/Applications"
        set position of item _file of container window to {390, 160}
      else
        set position of item _file of container window to {1000, 0}
      end
    end repeat
  close
  open
    update without registering applications
    delay 5
  close
  end tell
end tell
