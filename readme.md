# vkQuake for IPadOS (iOS)
This is a very bare bones port of vkQuake to run on IPadOS. It does not include any touch-screen interface it loads directly into the quake main menu. You 're supposed to play it with an gamecontroller though for menu and the in-game console you can use the external keyboard too. Playing with keyboard/mouse also works. Make sure to read the remarks below


## Howto install
open the vkquake xcode project and deploy it to your IPadOS (iOS) Device.

 **On first run the app will quit as the game-files can not be found, but this will create an vkquake folder which you can access through the Files-App.** Open the Files-App and under "On this device" there should now be can "vkQuake"-folder (contains an empty file *dummy.txt* which can be deleted). This is the base-dir thus copy the id1 and any other extension-pack/mod folders here. 

**iOS is case sensitive so make sure that the pak filenames are either lowercase  *pak0.pak*  or uppercase  *PAK0.PAK* .**

# Background Music
only supports ogg files. put them inside a music-folder in the respective game directory (e.g id1/music)

# HighDpi/Retina
there is a new console cvar **vid_highdpi** which when enabled will use the full retina resolution. You need to quit the app (either select quit from menu or type quit in console) after changing it so it gets saved to config file. after opening the app again the retina resolution will be used. 

On **IPadOS 15 Beta 2** my shiny new M1 12.9 IPad Pro has stuttering issues but only when running with HighDpi enabled (2732x2048@120). Running without it (1366x1024@120) it's fine. 

On my "old " 12.9 IPad Pro (from 2017 with A10X) on IPadOS 14.5 it runs fine in HighDpi (2732x2848@120). As i experienced other audio issues i assume it's Beta related. 

## gamepad configuration
use the ingame controls menu to configure the gamepad buttons

## saving configuration values
any changes done either via Menu or console will be saved if you quit the app via menu or enter "quit" in the console

## Expansion-pack or mods
open in-game console with `-key (tilde) and enter "game foldername" e.g. if you have hipnotic-expansion pack installed it would be game hipnotic

## IOS
technically it should work but it has not been tested

##  known issues
* **app currently does not run in background** thus if you switch app it will crash.
* can't change any video mode settings except for Highdpi via console (see above)
* tested on IPad's and M1 Mac running as IPad app
* keyboard input only tested with keyboards using smart-connector so don't know about bluetooth keyboards
* hasn't been tested with on-screen keyboard

## Escape-Key on Magic Keyboard
for keyboards without escape key you can remap the Caps Lock key to Escape in the Settings.

## Based on
* [vkQuake](https://github.com/Novum/vkQuake) - forked
* [Quake-for-iOS](https://github.com/tomkidd/Quake-iOS) - for the Launchscreen and Icon assets
* [MoltenVK](https://github.com/KhronosGroup/MoltenVK) - Vulkan to Metal translation layer

# ----------------------------------------------------------------

#  🌋 vkQuake
vkQuake is a port of id Software's [Quake](https://en.wikipedia.org/wiki/Quake_(video_game)) using Vulkan instead of OpenGL for rendering. It is based on the popular [QuakeSpasm](http://quakespasm.sourceforge.net/) and [QuakeSpasm-Spiked](https://triptohell.info/moodles/qss/) ports and runs all mods compatible with QuakeSpasm like [Arcane Dimensions](http://www.simonoc.com/pages/design/sp/ad.htm). 

Compared to QuakeSpasm vkQuake also features a software Quake like underwater effect, has better color precision, generates mipmap for water surfaces at runtime and has native support for anti-aliasing and AF. Due to the port using Vulkan and other optimizations it can also achieve much better frame rates. Code ported from QuakeSpasm-Spiked makes it possible to run the game at over 72FPS without breaking physics.

# Installation

## Windows
Copy all files inside the `vkquake-<version>_win64` or `vkquake-<version>_win32` folder in the zip to the Quake base directory. Overwrite any existing files. Afterward to run the game just execute `vkQuake.exe`.

## Linux
Copy all files inside the `vkquake-<version>-linux64` folder in the tar archive to the Quake base directory. Overwrite any existing files. Run `vkquake.AppImage`.

Note: Make sure all data files are lowercase, e.g. "id1", not "ID1" and "pak0.pak", not "PAK0.PAK". Some distributions of the game have upper case file names, e.g. from GOG.com.

# Vulkan
vkQuake shows basic usage of the API. For example it demonstrates render passes & sub passes, pipeline barriers & synchronization, compute shaders, push & specialization constants, CPU/GPU parallelism and memory pooling.

# Building

## Windows

Prerequisites:

* [Git for Windows](https://github.com/git-for-windows/git/releases)
* A [Vulkan-capable GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) with the appropriate drivers installed

Start `Git Bash` and clone the vkQuake repo:

~~~
git clone https://github.com/Novum/vkQuake.git
~~~

### Visual Studio

Install [Visual Studio Community](https://www.visualstudio.com/products/free-developer-offers-vs) with Visual C++ component.

Open the Visual Studio solution, `Windows\VisualStudio\vkquake.sln`, select the desired configuration and platform, then
build the solution.

### MinGW

Setup your [MinGW-w64](https://sourceforge.net/projects/mingw-w64/) environment, e.g. using [w64devkit](https://github.com/skeeto/w64devkit) or [MSYS2](https://www.msys2.org/).

Build 32 bit (x86) vkQuake:

~~~
cd vkQuake/Quake
make -f Makefile.w32
~~~

Build 64 bit (x64) vkQuake:

~~~
cd vkQuake/Quake
make -f Makefile.w64
~~~

If you are on Linux and want to cross-compile for Windows, see the `build_cross_win??.sh` scripts.

## Linux

Make sure that both your [GPU](https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility) and your GPU driver supports Vulkan.

To compile vkQuake, first install the build dependencies:

Ubuntu:
~~~
apt-get install git make gcc libsdl2-dev libvulkan-dev libvorbis-dev libmad0-dev libx11-xcb-dev
~~~

Arch Linux:
~~~
pacman -S git flac glibc libgl libmad libvorbis libx11 sdl2 vulkan-validation-layers
~~~

\* Please note that for vkquake > v0.50, you will need at least v1.0.12.0 of libvulkan-dev (See [#55](https://github.com/Novum/vkQuake/issues/55)).

Then clone the vkQuake repo:

~~~
git clone https://github.com/Novum/vkQuake.git
~~~

Now go to the Quake directory and compile the executable:

~~~
cd vkQuake/Quake
make
~~~

### Note
vkQuake 0.97 and later requires at least **SDL2 2.0.6 with enabled Vulkan support**. The precompiled versions in some of the distribution repositories (e.g. Ubuntu) do not currently ship with Vulkan support. You will therefore need to compile it from source. Make sure you have libvulkan-dev installed before running configure.

## MacOS

To compile vkQuake, first install the build dependencies with Homebrew:

~~~
brew install molten-vk vulkan-headers sdl2 libvorbis flac mad
~~~

Then clone the vkQuake repo:

~~~
git clone https://github.com/Novum/vkQuake.git
~~~

Now go to the Quake directory and compile the executable:

~~~
cd vkQuake/Quake
make
~~~

# Usage

Quake has 4 episodes that are split into 2 files:

* `pak0.pak`: contains episode 1
* `pak1.pak`: contains episodes 2-4

These files aren't free to distribute, but `pak0.pak` is sufficient to run the game and it's freely available via the
[shareware version of Quake](https://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake/). Use [7-Zip](http://7-zip.org/) or a similar file archiver to extract
`quake106.zip/resource.1/ID1/PAK0.PAK`. Alternatively, if you own the game, you can obtain both .pak files from its install media.

Now locate your vkQuake executable, i.e. `vkQuake.exe` on Windows or `vkquake` on Ubuntu. You need to create an `id1` directory
next to that and copy `pak0.pak` there, e.g.:

* Windows: `Windows\VisualStudio\Build-vkQuake\x64\Release\id1\pak0.pak`
* Ubuntu: `Quake\id1\pak0.pak`

Then vkQuake is ready to play.

# Optional - Music / Soundtrack

The original quake had a great soundtrack by Nine Inch Nails. Unfortunately, the Steam version does not come with the soundtrack files. The GOG-provided files need to be converted before they are ready for use. In general, you'll just need to move a "music" folder to the correct location within your vkQuake installation (.e.g `/usr/share/quake/id1/music`). Most Quake engines play nicest with soundtracks placed in the `id1/music` subfolder vs. `sound\cdtracks`

QuakeSpasm, the engine vkQuake is derived from, supports OGG, MP3, FLAC, and WAV audio formats. The Linux version of QuakeSpasm/VkQuake requires external libraries: libogg or libvorbis for OGG support, libmad or libmpg123 for MP3, and libflac for FLAC. If you already have a setup that works for the engine you're currently using, then you don't necessarily have to change it. 

To convert the WAV files to FLAC, run this command with libflac and sox installed in a directory containing the WAV files:
~~~
for f in *.wav; do sox "$f" "${f%.wav}.flac"; done
~~~

Generally, the below setup works for multiple engines, including Quakespasm/vkQuake:

* The music files are loose files, NOT inside a pak or pk3 archive.
* The files are placed inside a "music" subfolder of the "id1" folder. For missionpack or mod soundtracks, the files are placed in a "music" subfolder of the appropriate game folder. So the original Quake soundtrack files go inside "id1\music", Mission Pack 1 soundtrack files go inside "hipnotic\music", and Mission Pack 2 soundtrack files go inside "rogue\music".
* The files are named in the pattern "tracknn", where "nn" is the CD track number that the file was ripped from. Since the soundtrack starts at the second CD track, MP3 soundtrack files are named "track02.mp3", "track03.mp3", etc. OGG soundtrack files are named "track02.ogg", "track03.ogg", etc. FLAC soundtrack files are named "track02.flac", "track03.flac", etc. WAV soundtrack files are named "track02.wav", "track03.wav", etc.

**See more:** [Quake Soundtrack Solutions (Steam Community)](http://steamcommunity.com/sharedfiles/filedetails/?id=119489135)
