# ⚠️ PROJECT ABANDONED / MOVED

**This repository is no longer maintained.**

Btw, you can still use v1.0.0 - Golden Era Release for old macs with 10.4-10.6 MacOSX

The functionality of **iTunesMediaInfoFix** has been completely integrated into a new, more powerful project:

## 🚀 [iGeniusAI](https://github.com/MiChiRose/iGeniusAI)

Please head over to the new repository for:
- **Combined Features:** AI Playlist Generation + Media Metadata Fixing.
- **Better Stability:** Modular architecture and improved legacy macOS support.
- **Latest Updates:** All future development happens there.

---

<details>
<summary><b>📜 Old Project Description (Archive)</b></summary>

# iTunesMediaInfoFix 
**The ultimate restoration tool for legacy iTunes libraries.**

This project offers two distinct versions tailored for different eras of Mac OS X. Whether you are running a relatively modern High Sierra machine or a vintage PowerPC Mac on Tiger, there is a tool for you.

## 🌟 Main Version (OS X 10.7 Lion – 10.13 High Sierra)
A robust, monolithic application with a native GUI and advanced cloud features.

### Key Features:
- 🚀 **Smart Merge:** Unifies albums like "Artist - Hits" and "Artist: Hits" into a single entity by normalizing text.
- 🌎 **Apple Metadata Fetch:** Automatically downloads Year, Genre, Track Number, and official Album names via the Apple iTunes Search API.
- 📦 **Monolithic & Portable:** Zero dependencies. Powered by an embedded Python 2.7 backend and Tkinter GUI.
- 🛡️ **Safety First:** Built-in analysis phase, pre-flight internet check, and robust error logging to your Desktop.

---

## 🕰️ Legacy Edition (OS X 10.4 Tiger – 10.6 Snow Leopard)
A lightweight, pure AppleScript version designed specifically for older Intel and PowerPC Macs. 

Because older systems lack modern SSL certificates (which breaks API connections) and use older versions of Python, this edition focuses entirely on offline library organization.

### Key Features:
- 🗃️ **Offline Smart Merge:** Analyzes your entire library locally and merges split albums using native UNIX text processing (`sed`/`awk`) via AppleScript.
- ⚡ **Ultra-Lightweight:** No GUI overhead. Uses classic Mac OS X dialog boxes.
- 🔋 **PowerPC Safe:** Guaranteed to run smoothly on G4/G5 processors without crashing or causing high CPU loads.

---

## How to use
1. Go to the **Releases** tab on GitHub.
2. Download the ZIP file that matches your OS version:
   - `iTunesMediaInfoFix.zip` (for 10.7+)
   - `iTunesMediaInfoFix_Legacy.zip` (for 10.4 - 10.6)
3. Unzip and move the `.app` to your Applications or Desktop.
4. Double-click to run!

## For Developers
The source code and builder scripts for both versions are available in the `/Source` folder. 
- Run `build_app.sh` to compile the Main version.
- Run `build_legacy_app.sh` to compile the Legacy edition.

*Keep the legacy Mac spirit alive!*

</details>
