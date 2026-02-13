## Troubleshooting

API github limit error. Script will fail sometimes when getting the RELEASE_VERSION on university networks.
Replace the automatic search with the version you want.

Download script and them modify.
```
wget https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh
```

```bash
#-----------------------------------------------------
# Download Joplin
#-----------------------------------------------------

# Get the latest version to download
# PATCH
if [[ "$INCLUDE_PRE_RELEASE" == true ]]; then
  RELEASE_VERSION=$($DL - "https://api.github.com/repos/laurent22/joplin/releases" | grep -Po '"tag_name": ?"v\K.*?(?=")' | sort -rV | head -1)
else
  RELEASE_VERSION=$($DL - "https://api.github.com/repos/laurent22/joplin/releases/latest" | grep -Po '"tag_name": ?"v\K.*?(?=")')
fi
```

Solution
```
RELEASE_VERSION=3.5.12
```
