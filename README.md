# vlc-imdb-info
A plugin for vlc , to see the plot and the imdb rating of the movie that vlc is currently playing. 

A simple plugin for vlc media player which will allow any one with vlc media player to install this plugin and display the currently playing movie plot and its rating from IMDB using the http://omdbapi.com/

## INSTALLATION:

Create a directory "extensions" at this location if it doesn't exists, then extract the file "imdb-info.lua" from the archive inside:

    Windows (all users): %ProgramFiles%\VideoLAN\VLC\lua\extensions\
    Windows (current user): %APPDATA%\vlc\lua\extensions\
    Linux (all users): /usr/lib/vlc/lua/extensions/
    Linux (current user): ~/.local/share/vlc/lua/extensions/
    Mac OS X (all users): /Applications/VLC.app/Contents/MacOS/share/lua/extensions/
    Mac OS X (current user): /Users/%your_name%/Library/Application Support/org.videolan.vlc/lua/extensions/

Note : Sucessfully tested on Linux. With VLC 2.2.0

##USAGE:

* Open Vlc
* Start your video / movie
* Click on the menu View > View the media information on imdb
* Verify the name and remove any extra file information
* Put the movie year else leave it blank
* Click on Search
* That's it, the plot and IMDB rating should appear.

If the information given is wrong then please make sure the movie name and year is correct

### Example Usages
> Movie.Name.Year.ENCODING.RESOLUTION.format

should be replaced with

> Movie Name
> Year

