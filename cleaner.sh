files=(".DS_Store" ".AppleDouble" ".LSOverride" ".DocumentRevisions-V100" ".fseventsd" ".Spotlight-V100" ".TemporaryItems" ".Trashes" ".VolumeIcon.icns" ".com.apple.timemachine.donotpresent" ".AppleDB" ".AppleDesktop" "Thumbs.db" "ehthumbs.db" "ehthumbs_vista.db" "desktop.ini")

for f in ${files[@]}; do
  rm -r -f -v **/${f}
done