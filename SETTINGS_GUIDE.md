# Science Conversion - Settings Guide

## Overview
Version 2.2.0 introduces customizable mod settings that allow you to control how science pack conversions work in your game.

## Accessing Settings
1. Launch Factorio
2. Go to **Main Menu → Settings → Mod Settings**
3. Click on the **Startup** tab
4. Find "Science Conversion" settings
5. Adjust values as desired
6. **Restart your game** for changes to take effect

## Available Settings

### 1. Linear Conversion Scaling (Boolean)
**Default: Enabled**

Controls whether conversion ratios increase with tier progression.

- **Enabled (Default)**: Conversion ratios scale progressively
  - Red → Green: 10:1
  - Green → Blue: 20:1
  - Blue → Purple: 30:1
  - Purple → Yellow: 50:1
  - White → Planet Sciences: 100:1
  
- **Disabled**: All upgrades use the same base ratio
  - All conversions use the "Base Upgrade Ratio" setting

### 2. Base Upgrade Ratio (Integer)
**Default: 10** | **Range: 1-1000**

Sets the base number of science packs required to upgrade to a higher tier.

- With linear scaling: This value is multiplied by the tier multiplier
- Without linear scaling: This value is used for all upgrades

**Examples:**
- Set to 5: Easier conversions (5, 10, 15, 25, 50 with linear scaling)
- Set to 20: Harder conversions (20, 40, 60, 100, 200 with linear scaling)

### 3. Base Downgrade Ratio (Integer)
**Default: 1** | **Range: 1-100**

Sets how many science packs are required to downgrade to a lower tier.

**Examples:**
- Set to 1 (Default): 1:1 conversion when downgrading
- Set to 2: Requires 2 higher-tier packs to get 1 lower-tier pack

### 4. Product Amount Multiplier (Integer)
**Default: 1** | **Range: 1-100**

Multiplies the number of science packs produced by each conversion.

**Examples:**
- Set to 1 (Default): Get 1 science pack per conversion
- Set to 5: Get 5 science packs per conversion
- Set to 10: Get 10 science packs per conversion

**Note:** This affects both upgrades and downgrades equally.

### 5. Conversion Time (Integer)
**Default: 10 seconds** | **Range: 1-300 seconds**

Sets how long each conversion takes to complete.

**Examples:**
- Set to 5: Faster conversions (5 seconds each)
- Set to 30: Slower conversions (30 seconds each)

## Example Configurations

### Easy Mode
- Linear Scaling: Disabled
- Base Upgrade Ratio: 5
- Base Downgrade Ratio: 1
- Product Multiplier: 2
- Conversion Time: 5

*Result: Quick, easy conversions with double output*

### Hard Mode
- Linear Scaling: Enabled
- Base Upgrade Ratio: 20
- Base Downgrade Ratio: 2
- Product Multiplier: 1
- Conversion Time: 30

*Result: Expensive, slow conversions that require planning*

### Balanced (Default)
- Linear Scaling: Enabled
- Base Upgrade Ratio: 10
- Base Downgrade Ratio: 1
- Product Multiplier: 1
- Conversion Time: 10

*Result: Original mod behavior with progressive difficulty*

## Technical Details

### How Linear Scaling Works
When enabled, the mod uses these multipliers:
- Tier 1→2 (Red→Green): 1x base ratio = 10
- Tier 2→3 (Green→Blue): 2x base ratio = 20
- Tier 3→4 (Blue→Purple): 3x base ratio = 30
- Tier 4→5 (Purple→Yellow): 5x base ratio = 50
- Tier 6→7 (White→Planet): 10x base ratio = 100

### File Structure
- `settings.lua` - Defines the mod settings
- `data-final-fixes.lua` - Applies settings to recipes
- `locale/en/locale.cfg` - English translations for settings

## Troubleshooting

**Q: Settings aren't applying?**
A: Make sure to restart Factorio after changing startup settings.

**Q: Can I change settings mid-game?**
A: These are startup settings, so you'll need to restart your game. Your save file will be compatible.

**Q: What happens to existing factories?**
A: Existing conversion buildings will automatically use the new ratios after restart.

## Feedback
If you have suggestions for additional settings or find any issues, please submit a request on the mod portal or contact us!
