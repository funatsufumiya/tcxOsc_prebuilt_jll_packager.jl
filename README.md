# TrussC_prebuilt_jll_packager.jl

This repository is used to create [TrussC_prebuilt_jll](https://github.com/funatsufumiya/TrussC_prebuilt_jll) automatically

## Usage

```bash
# 1. put dll/so/dylib into libs folder

# 2. generate tar.gz
./create_releases.sh

# 3. git add libs, git tag vXX.XX.XX and git push --tags

# 4. upload tar.gz to releases

# 5. generate Artifacts.toml
./gen_artifacts.sh
```

## Develop

In order to build libTrussC.dll/so/dylib see https://github.com/funatsufumiya/tcxJuliaCxxWrap