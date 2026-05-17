function fixxattr
    sudo xattr -cr "$argv[1]"
    sudo xattr -r -d com.apple.quarantine "$argv[1]"
    sudo codesign --force --deep --sign - "$argv[1]"
end
