function oxicord-update
    set url (curl -s https://api.github.com/repos/linuxmobile/oxicord/releases/latest | grep 'browser_download_url.*aarch64-apple' | cut -d '"' -f 4)
    curl -L -o $HOME/.local/bin/oxicord $url && chmod +x $HOME/.local/bin/oxicord
end
