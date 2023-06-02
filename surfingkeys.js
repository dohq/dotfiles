// an example to create a new mapping `ctrl-y`
api.mapkey('<ctrl-y>', 'Show me the money', function() {
    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map('gt', 'T');

// an example to remove mapkey `Ctrl-i`
api.unmap('<ctrl-i>');

settings.blocklistPattern =  /mail.google.com|console.aws.amazon.com|192.168.10.10/i;


// set theme
settings.theme = `
.sk_theme {
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
	color: #333;
	background: #ebdbb2;
}
.sk_theme #sk_omnibarSearchResult ul>li:nth-child(odd) {
	background: #282828;
}
.sk_theme #sk_omnibarSearchResult ul>li.focused {
	background: #d3869b;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>
