DebugTools Changelog
=======
# 1.3.0.1
* Fixed the "Full Heal Party" and "Resurrect Party" commands.

# 1.3.0.0
* Updated to the DE.
* Cleaned up / re-organized dialog files. Menus like the Race Change Menu and Talent Editor are now started as dual-dialogs, which works better overall.

# 1.2.1.0
* Tweaked waypoint teleporting - Should work for teleporting to all levels now.

# 1.2.0.0
* Debug Menu
	* Talent Menu
		* Added a new Talent Menu, allowing you to add/remove talents (and racial talents) at will.
		* Contains pages for every talent in the game, including unused talents and racial talents.

# 1.1.5.0
* Tweaked Waypoints Command
	* Made waypoints teleport the party to other levels after unlocking them with the menu command.
	* Added Fort Joy and The Nameless Isle waypoints. Originally they were only registered when those specific levels were loaded.

# 1.1.4.0
* Added LeaderLib support (dependency-free, a.k.a. optional).
	* If LeaderLib is installed, Debug Tools will register its settings to the LeaderLib "Mod Menu". Otherwise, the settings book will spawn as normal.
* Removed the "View Registered Mods" menu option. Use LeaderLib instead.
	
# 1.1.3.0
* Updated to the latest hotfix.
* Debug Menu
	* Added a new command: View Registered Mods (LLAPI).
		* This provides a way to view which mods have been registered under a specific database - Useful in making sure those mods were properly updated.
	* Added a Race Menu (currently WIP).
* Refactored update code to a new script.

# 1.1.2.0
* Debug Menu
	* New Quick Commands Menu
		* Enable/Disable Immortality
			* Makes you completely immune to damage and death.
		* Moved Unlock Waypoints command to Quick Commands Menu.
		* New Remove Source Collar Commands
			* Available for both (Self) and (Party).
		* New Fully Heal Party Command
		* New Resurrect Party Commands
			* Also restores full health to the resurrected character.
	* Add Points (Self)/(Party) Menus
		* New Add Source Point Command
		* New Increase/Decrease Max Source Points Command
* Fork
	* Made the "Kill Mode" fork a little more ridiculous.
		
# 1.1.1.1
* Rebuilt the story to incorporate the new patch changes (no actual changes to DebugTools scripts).
			
# 1.1.1.0
* Fix for Add Points (Party) commands locking the game up.
* Debug Menu
	* New Commands
		* Add All Waypoints
			* Adds every waypoint in the game. You can use this to teleport to other levels, but take care as your quests will probably get screwed up.

# 1.1.0.0
* New Debug Menu Skill
	* Added a new debug menu, accessible with the skill "Open DebugTools Menu". Contains various commands and settings.
	* New Commands
		* Add Points (Self) & (Party) Menu
			* Add Attribute Point
			* Add Ability Point
			* Add Civil Point
			* Add Talent Point
		* Add Skills
			* An alternative way to add the various debug skills without equipping the fork.
		* Tag Editor
			* Enable/disable the various character creation tags, and Hero/Villain.
	* New Settings
		* Log Settings
			* Disable/Enable Log
			* Log Flag Changes (Party)
			* Display Flag Changes (Self)	
* New Skills
	* Teleport Self
	* Teleport Party
	* Teleport Target
		* Acts a little wonky when selecting both a character and an item.
# 1.0.0.0
* Initial Release
