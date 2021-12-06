// an example to create a new mapping `ctrl-y`
// mapkey('<ctrl-y>', 'Show me the money', function() {
//   Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
// });

// // an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
// map('gt', 'T');
//
// // an example to remove mapkey `Ctrl-i`
// unmap('<ctrl-i>');

// Characters when pressing F
Hints.characters = '^zxawe123q$%"';

settings.smoothScroll = false;

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #151320;
    color: #F8F8F2;
}
.sk_theme tbody {
    color: #80FFEA;
}
.sk_theme input {
    color: #FFFF80;
}
.sk_theme .url {
    color: #98c379;
}
.sk_theme .annotation {
    color: #80FFEA;
}
.sk_theme .omnibar_highlight {
    color: #FF80BF;
}
.sk_theme .omnibar_timestamp {
    color: #80FFEA;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #22212C;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #9580FF;
}
#sk_status, #sk_find {
    font-size: 20pt;
}
`;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>
