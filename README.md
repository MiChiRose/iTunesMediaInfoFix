# iTunesMediaInfoFix 
**The ultimate restoration tool for legacy iTunes libraries (macOS 10.9 - 10.13).**

## What is this?
If you have a large music collection on an older Mac, you've likely seen "Unknown Albums" or split records due to minor punctuation differences. This monolithic app fixes your entire library in one click.

### Key Features:
- 🚀 **Smart Merge:** Unifies albums like "Artist - Hits" and "Artist: Hits" into a single entity by normalizing text.
- 🌎 **Apple Metadata Fetch:** Automatically downloads Year, Genre, Track Number, and official Album names via the Apple iTunes Search API.
- 📦 **Monolithic & Portable:** Zero dependencies. Works "out of the box" on OS X Mavericks and High Sierra.
- 🛡️ **Safety First:** Built-in analysis phase, pre-flight internet check, and robust error logging.
- 🎨 **Classic Design:** Skeuomorphic icon and native macOS GUI (with a progress bar).

## How to use
1. Download `iTunesMediaInfoFix.zip` from the repository.
2. Unzip it and move `iTunesMediaInfoFix.app` to your Applications or Desktop.
3. Run it, wait for the Analysis to complete, and click **Start Restoration**.
*Note: An active internet connection is required.*

## Troubleshooting
If the application crashes or encounters a fatal error, it will automatically generate a log file named `iTunesFix_Crash_Log.txt` on your Desktop. Please open an Issue on GitHub and attach this file so the community can investigate.

## For Developers
The entire logic is written in Python 2.7 (for native legacy Mac compatibility) and wrapped in an AppleScript bundle utilizing Tkinter for the GUI. 

You can find the builder script in the `/Source` folder. 
To build the app yourself:
1. Ensure `folder-wood.icns` is on your Desktop.
2. Run `sh build_app.sh`.
3. The script will inject the Python code, compile the AppleScript, apply the icon, and clear quarantine attributes automatically.
