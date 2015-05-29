var AUTH = AUTH || {};

var script_tag = document.createElement('script');
script_tag.setAttribute("type", "text/javascript");
script_tag.async = true;
script_tag.setAttribute("src", "//auth.look-at-media.com/gui/embed-71a26a6780427687f74832ff6b90942a.js");
(document.getElementsByTagName("head")[0] || document.documentElement).appendChild(script_tag);

var css_tag = document.createElement('link');
css_tag.setAttribute("rel", "stylesheet");
css_tag.setAttribute("href", "//auth.look-at-media.com/gui/embed-d3dcc913efbfd435b73ac9bc2cd7943d.css");
(document.getElementsByTagName("head")[0] || document.documentElement).appendChild(css_tag);
