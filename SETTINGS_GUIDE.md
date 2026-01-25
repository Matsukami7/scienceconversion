# Science Conversion - Settings Guide

## Overview
Version 2.4.0 introduces customizable mod settings that allow you to control how science pack conversions work in your game, including bidirectional toggles and the ability to enable/disable specific conversion tiers.

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

### 6. Enable Upgrade Conversions (Boolean)
**Default: Enabled**

Master toggle for all upgrade conversions (lower tier → higher tier).

**When disabled:**
- All recipes that upgrade science packs are hidden
- Only downgrade conversions remain available
- Perfect for challenge runs where you must produce all science types

**Use cases:**
- Force proper science production chains
- Prevent "skipping" lower tier science production
- Create harder progression challenges

### 7. Enable Downgrade Conversions (Boolean)
**Default: Enabled**

Master toggle for all downgrade conversions (higher tier → lower tier).

**When disabled:**
- All recipes that downgrade science packs are hidden
- Only upgrade conversions remain available
- Prevents "recycling" higher tier science into lower tiers

**Use cases:**
- Prevent exploitation of higher tier science production
- Force one-way progression through science tiers
- Create unique challenge scenarios

**Note:** Both bidirectional toggles work in combination with tier-specific toggles. A recipe must pass BOTH checks to be enabled.

### 8-16. Tier-Specific Toggles (Boolean)
**Default: All Enabled**

Individual toggles for each conversion tier. Disable specific tiers to restrict certain conversions for challenge runs or balance.

- **Tier 1: Red ↔ Green** - Automation ↔ Logistic science
- **Tier 2: Green ↔ Blue** - Logistic ↔ Chemical science
- **Tier 3: Blue ↔ Purple** - Chemical ↔ Production science
- **Tier 4: Purple ↔ Yellow** - Production ↔ Utility science
- **Tier 5: White ↔ Orange** - Space ↔ Metallurgic science
- **Tier 6: White ↔ Pink** - Space ↔ Electromagnetic science
- **Tier 7: White ↔ Lime** - Space ↔ Agricultural science
- **Tier 8: White ↔ Dark Blue** - Space ↔ Cryogenic science
- **Tier 9: White ↔ Black** - Space ↔ Promethium science

**When disabled:**
- Both recipes for that tier are hidden
- The technology for that tier is hidden if it has no other effects
- Existing buildings won't be able to craft those recipes

**Use cases:**
- Disable early-game conversions (Tier 1-4) for a harder start
- Disable Space Age conversions (Tier 5-9) for vanilla-only gameplay
- Create custom progression by selectively enabling tiers

## Example Configurations

### Easy Mode
- Linear Scaling: Disabled
- Base Upgrade Ratio: 5
- Base Downgrade Ratio: 1
- Product Multiplier: 2
- Conversion Time: 5
- Enable Upgrades: Yes
- Enable Downgrades: Yes
- All Tiers: Enabled

*Result: Quick, easy conversions with double output*

### Hard Mode
- Linear Scaling: Enabled
- Base Upgrade Ratio: 20
- Base Downgrade Ratio: 2
- Product Multiplier: 1
- Conversion Time: 30
- Enable Upgrades: Yes
- Enable Downgrades: Yes
- All Tiers: Enabled

*Result: Expensive, slow conversions that require planning*

### Balanced (Default)
- Linear Scaling: Enabled
- Base Upgrade Ratio: 10
- Base Downgrade Ratio: 1
- Product Multiplier: 1
- Conversion Time: 10
- Enable Upgrades: Yes
- Enable Downgrades: Yes
- All Tiers: Enabled

*Result: Original mod behavior with progressive difficulty*

### Vanilla Only (No Space Age)
- Linear Scaling: Enabled
- Base Upgrade Ratio: 10
- Base Downgrade Ratio: 1
- Product Multiplier: 1
- Conversion Time: 10
- Enable Upgrades: Yes
- Enable Downgrades: Yes
- Tiers 1-4: Enabled
- Tiers 5-9: Disabled

*Result: Only base game science conversions available*

### Space Age Only
- Linear Scaling: Enabled
- Base Upgrade Ratio: 10
- Base Downgrade Ratio: 1
- Product Multiplier: 1
- Conversion Time: 10
- Enable Upgrades: Yes
- Enable Downgrades: Yes
- Tiers 1-4: Disabled
- Tiers 5-9: Enabled

*Result: Only Space Age science conversions available*

### Upgrades Only Challenge (NEW in v2.4.0)
- Linear Scaling: Enabled
- Base Upgrade Ratio: 10
- Base Downgrade Ratio: 1
- Product Multiplier: 1
- Conversion Time: 10
- Enable Upgrades: Yes
- Enable Downgrades: No
- All Tiers: Enabled

*Result: Can only convert lower tier science to higher tier. Forces proper production chains.*

### Downgrades Only Challenge (NEW in v2.4.0)
- Linear Scaling: Enabled
- Base Upgrade Ratio: 10
- Base Downgrade Ratio: 1
- Product Multiplier: 1
- Conversion Time: 10
- Enable Upgrades: No
- Enable Downgrades: Yes
- All Tiers: Enabled

*Result: Can only convert higher tier science to lower tier. Must produce all high-tier science normally.*

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
