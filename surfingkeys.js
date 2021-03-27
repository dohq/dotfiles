settings.smoothScroll = false;
settings.scrollStepSize = 70;
settings.nextLinkRegex = /((forward|>>|next|次[のへ]|→)+)/i
settings.prevLinkRegex = /((back|<<|prev(ious)?|前[のへ]|←)+)/i
settings.newTabPosition = 'right'
settings.omnibarMaxResults = 12
settings.historyMUOrder = false
settings.blacklistPattern = /.*mail.google.com.*|.*inbox.google.com.*|trello.com|.*krunker.io.*|duolingo.com|udemy.com/i;

// ------------------------------------------------------------
// Navigation
map(';', ':') // replace : ;
// page
map('<Ctrl-u>', 'e');
map('<Ctrl-d>', 'd');
// tab
map('<Shift-j>', 'R');
map('<Shift-k>', 'E');
// hints
map('<Shift-f>', 'af');
// Proxy
unmap('cp');
unmap(';cp');
unmap(';ap');
unmap(';pa');
unmap(';pb');
unmap(';pd');
unmap(';ps');
unmap(';pc');
unmap('sfr');

// disable emoji completion
iunmap(":");

// ------------------------------------------------------------
// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #282828;
    color: #ebdbb2;
}
.sk_theme tbody {
    color: #b8bb26;
}
.sk_theme input {
    color: #d9dce0;
}
.sk_theme .url {
    color: #98971a;
}
.sk_theme .annotation {
    color: #b16286;
}
.sk_theme .omnibar_highlight {
    color: #ebdbb2;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #282828;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #565656;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
