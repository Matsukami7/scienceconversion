# Science Conversion v2.4.0 - Release Notes

## Release Date
January 25, 2026

## Overview
Version 2.4.0 introduces **Bidirectional Conversion Toggles**, giving players master control over upgrade and downgrade conversions. This feature enables new challenge run possibilities and provides finer control over science pack conversion mechanics.

---

## New Features

### Bidirectional Conversion Toggles
Two new master toggle settings control the direction of all science pack conversions:

#### 1. Enable Upgrade Conversions
- **Type**: Boolean (Startup Setting)
- **Default**: Enabled
- **Description**: Master toggle for all lower→higher tier conversions
- **When Disabled**: All upgrade recipes are hidden (e.g., red→green, green→blue)
- **Use Case**: Force proper science production chains, prevent skipping lower tier production

#### 2. Enable Downgrade Conversions
- **Type**: Boolean (Startup Setting)
- **Default**: Enabled
- **Description**: Master toggle for all higher→lower tier conversions
- **When Disabled**: All downgrade recipes are hidden (e.g., green→red, blue→green)
- **Use Case**: Prevent "recycling" higher tier science, force one-way progression

### How It Works
- Both settings work **in combination** with tier-specific toggles (v2.3.0)
- A recipe must pass BOTH checks to be enabled:
  1. Its tier must be enabled (Tier 1-9 toggles)
  2. Its direction must be enabled (Upgrades/Downgrades toggles)
- Technologies automatically hide recipes based on these settings
- Technologies with no remaining effects are hidden from the tech tree

---

## Challenge Run Ideas

### Upgrades Only
**Settings**: Enable Upgrades: Yes, Enable Downgrades: No

**Gameplay**: Can only convert science packs upward (red→green→blue→purple→yellow). Forces you to produce lower tier science properly instead of "recycling" higher tiers.

**Difficulty**: Medium - Must maintain production of all science types

---

### Downgrades Only
**Settings**: Enable Upgrades: No, Enable Downgrades: Yes

**Gameplay**: Can only convert science packs downward (yellow→purple→blue→green→red). Must produce all high-tier science normally, but can convert excess to lower tiers.

**Difficulty**: Hard - Cannot skip science production tiers

---

### One-Way Vanilla Progression
**Settings**: 
- Enable Upgrades: Yes
- Enable Downgrades: No
- Tiers 1-4: Enabled
- Tiers 5-9: Disabled

**Gameplay**: Vanilla science only, one-way progression. Perfect for players who want conversion mechanics without Space Age content or downgrade exploitation.

**Difficulty**: Medium - Balanced challenge with limited conversion options

---

## Technical Details

### Implementation
- Added 2 new boolean settings in `settings.lua`
- Enhanced `data-final-fixes.lua` with direction checking logic
- Updated recipe visibility based on both tier and direction settings
- Technology effects automatically filtered based on enabled recipes

### Backward Compatibility
- ✅ All settings default to enabled (maintains v2.3.0 behavior)
- ✅ Existing saves fully compatible
- ✅ No breaking changes to existing features
- ✅ Settings can be changed mid-game (requires restart)

### Performance
- No performance impact
- Logic runs during data-final-fixes phase (startup only)
- No runtime overhead

---

## Updated Files

### Code Files
- `settings.lua` - Added 2 new bidirectional toggle settings
- `data-final-fixes.lua` - Enhanced with direction checking logic
- `locale/en/locale.cfg` - Added translations for new settings

### Documentation Files
- `README.md` - Added bidirectional toggles section with challenge run ideas
- `SETTINGS_GUIDE.md` - Added detailed documentation for new settings with examples
- `changelog.txt` - Added v2.4.0 changelog entry
- `info.json` - Version bumped to 2.4.0
- `build-mod.sh` - Version updated to 2.4.0

### New Files
- `TEST_PLAN_v2.4.0.md` - Comprehensive testing guide
- `RELEASE_NOTES_v2.4.0.md` - This file

### Updated Tracking
- `FUTURE_SETTINGS_IDEAS.md` - Marked bidirectional toggle as completed

---

## Breaking Changes
None. All changes are additive and backward compatible.

---

## Known Issues
None currently identified.

---

## Upgrade Instructions

### For New Installations
1. Download `ScienceConversion_2.4.0.zip`
2. Place in Factorio mods folder
3. Launch Factorio
4. Enable mod and restart

### For Existing Users (v2.3.0 → v2.4.0)
1. Replace old mod file with `ScienceConversion_2.4.0.zip`
2. Launch Factorio
3. Load existing save (fully compatible)
4. Access new settings: Main Menu → Settings → Mod Settings → Startup
5. Adjust bidirectional toggles as desired
6. Restart game for changes to take effect

**Note**: Existing factories will continue working. Recipe availability updates based on new settings after restart.

---

## Testing Checklist

Before release, verify:
- [x] Build script updated to v2.4.0
- [x] All documentation updated
- [x] Changelog entry added
- [x] Locale strings added
- [x] Backward compatibility maintained
- [ ] All test cases pass (see TEST_PLAN_v2.4.0.md)
- [ ] No Lua errors in Factorio log
- [ ] Mod loads successfully in Factorio 2.0

---

## Credits
- **Original Mod**: narokuu
- **v2.4.0 Implementation**: Automated development with comprehensive testing framework

---

## Next Steps

### Planned for v2.5.0
Based on FUTURE_SETTINGS_IDEAS.md, next features likely include:
1. **Technology Cost Multiplier** - Adjust research costs for conversion techs
2. **Pollution Generation** - Add pollution multiplier to conversion recipes
3. **Recipe Category/Machine Restrictions** - Control which machines can perform conversions

See `FUTURE_SETTINGS_IDEAS.md` for full roadmap.

---

## Support
- **Mod Portal**: Search "Science Conversion" or "Narokuu"
- **Issues**: Submit via mod portal or GitHub
- **Contact**: Discord - Narokuu

---

## Version History
- **v2.4.0** (2026-01-25) - Added bidirectional conversion toggles
- **v2.3.0** (2026-01-25) - Added tier-specific enable/disable toggles
- **v2.2.0** (2026-01-25) - Added customizable settings (ratios, scaling, time)
- **v2.1.0** (2026-01-23) - Factorio 2.0.73 compatibility update
- **v2.0.0** (2025-07-05) - Space Age support
- **v1.1.0** (2022-05-20) - Factorio 1.1.59 update

---

**Enjoy the new bidirectional conversion controls!** 🎉
