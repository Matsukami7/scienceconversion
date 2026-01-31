# GitHub Actions Workflows

This directory contains automated workflows for building and releasing the ScienceConversion mod.

## Workflows

### 1. `release.yml` - Stable Releases

**Triggers:** When you push a version tag like `v2.5.0`

**What it does:**
- Verifies the tag version matches `info.json`
- Builds a properly structured mod zip file
- Extracts changelog for the version
- Creates a GitHub Release with the zip attached
- Marks as stable release (not pre-release)

**Usage:**
```bash
# Make sure info.json has the correct version
git tag v2.5.0
git push origin v2.5.0
```

### 2. `beta-release.yml` - Beta/Alpha Releases

**Triggers:** When you push a beta/alpha tag like `v2.5.0-beta.1`

**What it does:**
- Verifies the base version (2.5.0) matches `info.json`
- Builds mod zip with the full beta version
- Updates `info.json` in the zip to include beta suffix
- Creates a GitHub Pre-Release with beta warning
- Marks as pre-release for testing

**Usage:**
```bash
# info.json should have base version (e.g., 2.5.0)
git tag v2.5.0-beta.1
git push origin v2.5.0-beta.1
```

## Release Process

### For Stable Releases (from master branch)

1. Update `info.json` with new version
2. Update `changelog.txt` with release notes
3. Update `build-mod.sh` with new version
4. Commit changes
5. Create and push tag:
   ```bash
   git tag v2.5.0
   git push origin v2.5.0
   ```
6. GitHub Actions will automatically create the release

### For Beta Releases (from dev branch)

1. Make sure `info.json` has the base version (e.g., `2.5.0`)
2. Update `changelog.txt` if needed
3. Commit changes to dev branch
4. Create and push beta tag:
   ```bash
   git tag v2.5.0-beta.1
   git push origin v2.5.0-beta.1
   ```
5. GitHub Actions will create a pre-release

## What Gets Packaged

The workflows automatically exclude development files:
- `.git/` directory
- `.github/` directory
- `.gitignore`
- `build-mod.sh`
- `.DS_Store`
- `DEV_README.md`
- `docs/` directory

## Artifacts

Both workflows upload the built zip files as artifacts:
- **Stable releases:** Retained for 90 days
- **Beta releases:** Retained for 30 days

You can download these from the Actions tab even if you delete the release.

## Version Format

- **Stable:** `v2.5.0`, `v2.6.0`, etc.
- **Beta:** `v2.5.0-beta.1`, `v2.5.0-beta.2`, etc.
- **Alpha:** `v2.5.0-alpha.1`, `v2.5.0-alpha.2`, etc.

## Troubleshooting

**Version mismatch error:**
- Make sure the tag version matches `info.json` exactly
- For beta releases, the base version should match

**Workflow doesn't trigger:**
- Make sure you pushed the tag: `git push origin v2.5.0`
- Check that the tag format matches the pattern

**Build fails:**
- Check the Actions tab for detailed logs
- Verify all required files are present in the repository
