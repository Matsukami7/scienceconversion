# Science Conversion

Convert Factorio science packs up and down tiers! Full support for Factorio 2.0 and Space Age content.

# NOTE: If you wish to play/try the beta features, please visit the repo and check the `beta` branch. As this will always have newest features that are under testing.
And refer to the readme called `Dev_README.md` for more information about the beta features.


## Overview

After researching the required technologies, you can convert science packs into one another - both up and down the tech tree! This allows you to create new and unique factory designs, optimize production chains, and customize your science progression.

## Features

- ✅ **Bidirectional Conversions** - Convert science packs both up and down tiers
- ✅ **All Science Types** - Supports vanilla and Space Age science packs
- ✅ **Fully Customizable** - 17 settings to control every aspect of conversions
- ✅ **Challenge Modes** - Enable/disable specific tiers or directions for unique gameplay
- ✅ **Pollution Control** - Make conversions clean (0 pollution) or dirty (10x pollution)
- ✅ **Balanced by Default** - Works great out of the box, customize if desired

## How It Works

1. Research the appropriate "Science Conversion" technology
2. Unlock conversion recipes for that tier
3. Use assemblers to convert science packs
4. Customize behavior via mod settings (optional)

**Example**: Research "Science Conversion Tier 1" to unlock:
- Red → Green (10 automation science → 1 logistic science)
- Green → Red (1 logistic science → 1 automation science)

---

## Mod Settings

Access settings via: **Main Menu → Settings → Mod Settings → Startup tab**

*Note: All settings require restarting your game to apply changes.*

### Core Settings

| Setting | Default | Range | Description |
|---------|---------|-------|-------------|
| **Linear Conversion Scaling** | Enabled | On/Off | Progressive ratios (10, 20, 30, 50, 100) or uniform ratios |
| **Base Upgrade Ratio** | 10 | 1-1000 | Science packs needed to upgrade to next tier |
| **Base Downgrade Ratio** | 1 | 1-100 | Science packs needed to downgrade to previous tier |
| **Product Amount Multiplier** | 1 | 1-100 | Multiply the output of all conversions |
| **Conversion Time** | 10 sec | 1-300 sec | How long each conversion takes |
| **Pollution Multiplier** | 1.0 | 0.0-10.0 | Pollution from conversions (0=clean, 10=extreme) |

### Direction Control

| Setting | Default | Description |
|---------|---------|-------------|
| **Enable Upgrade Conversions** | Enabled | Allow converting lower→higher tier science |
| **Enable Downgrade Conversions** | Enabled | Allow converting higher→lower tier science |

### Tier-Specific Toggles

Enable or disable individual conversion tiers:

| Tier | Conversion | Science Types |
|------|------------|---------------|
| **Tier 1** | Red ↔ Green | Automation ↔ Logistic |
| **Tier 2** | Green ↔ Blue | Logistic ↔ Chemical |
| **Tier 3** | Blue ↔ Purple | Chemical ↔ Production |
| **Tier 4** | Purple ↔ Yellow | Production ↔ Utility |
| **Tier 5** | White ↔ Orange | Space ↔ Metallurgic |
| **Tier 6** | White ↔ Pink | Space ↔ Electromagnetic |
| **Tier 7** | White ↔ Lime | Space ↔ Agricultural |
| **Tier 8** | White ↔ Dark Blue | Space ↔ Cryogenic |
| **Tier 9** | White ↔ Black | Space ↔ Promethium |

---

## Example Configurations

### Default (Balanced)
Perfect for most players - progressive difficulty with full conversion support.
- Linear Scaling: ✅ Enabled
- All conversions: ✅ Enabled
- Pollution: 1.0 (normal)

### Eco-Friendly
Zero pollution from conversions - perfect for avoiding biters.
- Pollution Multiplier: **0.0**
- All other settings: Default

### Vanilla Only
Disable Space Age conversions for base game only.
- Tiers 1-4: ✅ Enabled
- Tiers 5-9: ❌ Disabled

### Upgrades Only Challenge
Force proper science production - no recycling higher tier science.
- Enable Upgrades: ✅ Enabled
- Enable Downgrades: ❌ Disabled

### Pollution Challenge
Heavy pollution attracts more biters - combat-focused gameplay.
- Pollution Multiplier: **5.0** or higher
- All other settings: Default

### Easy Mode
Quick conversions with double output.
- Base Upgrade Ratio: **5**
- Product Multiplier: **2**
- Conversion Time: **5 seconds**
- Pollution: **0.5**

---

## Challenge Run Ideas

- **One-Way Progression**: Disable downgrades to force building all science types
- **Deathworld Enhancement**: Set pollution to 10.0 for maximum biter aggression
- **Space Age Only**: Disable tiers 1-4, enable only space science conversions
- **Clean Factory**: Set pollution to 0 for eco-friendly conversions
- **Hard Mode**: Increase upgrade ratios to 20+, slow conversion time to 30+ seconds

---

## Compatibility

- ✅ **Factorio 2.0+** - Fully compatible with latest version
- ✅ **Space Age DLC** - All planet science packs supported
- ✅ **Multiplayer** - Works perfectly in multiplayer games
- ✅ **Existing Saves** - Can be added to or removed from existing saves
- ✅ **Other Mods** - Compatible with most mods (no known conflicts)

---

## Installation

### Via Factorio Mod Portal (Recommended)
1. Open Factorio
2. Go to **Mods** → **Install Mods**
3. Search for "**Science Conversion**" or "**Narokuu**"
4. Click **Install**
5. Restart Factorio

### Manual Installation
1. Download the latest `.zip` file
2. Place in your Factorio mods folder:
   - **Windows**: `%appdata%\Factorio\mods`
   - **Mac**: `~/Library/Application Support/factorio/mods`
   - **Linux**: `~/.factorio/mods`
3. Restart Factorio

---

## FAQ

**Q: Can I change settings mid-game?**  
A: Yes! Settings can be changed anytime, but require restarting Factorio to apply. Your save file remains compatible.

**Q: Will this work with my existing save?**  
A: Yes! The mod can be safely added to or removed from existing saves.

**Q: Does this work in multiplayer?**  
A: Yes! All players need the mod installed with the same settings.

**Q: Can I disable pollution from conversions?**  
A: Yes! Set "Pollution Multiplier" to 0.0 for completely clean conversions.

**Q: How do I make conversions cheaper/more expensive?**  
A: Adjust "Base Upgrade Ratio" - lower = cheaper, higher = more expensive.

**Q: Can I disable Space Age conversions?**  
A: Yes! Disable tiers 5-9 in the tier-specific toggles.

---

## Support & Feedback

- **Mod Portal**: [Science Conversion](https://mods.factorio.com/)
- **Discord**: Narokuu
- **Issues**: Report bugs or request features via mod portal comments
- **Source Code**: Available on request

---

## Credits

- **Author**: Narokuu
- **Special Thanks**: 
  - Darthun - For guidance and original art
  - Justarandomgeek - Modding help and support
  - Factorio Dev Team - For making this amazing game
  - Factorio Modding Community - For tireless help and support

---

## Version History

See [changelog.txt](changelog.txt) for detailed version history.

**Current Version**: 2.4.0
- Added bidirectional conversion toggles (upgrades/downgrades)
- Added pollution multiplier control (0-10x)
- 17 total customization settings

---

## License

Please contact the author before editing or redistributing this mod.

If you use this mod in a video or stream, please link to the mod portal instead of providing direct downloads.

---

**Enjoy converting your science packs!** 🧪🔬⚗️
