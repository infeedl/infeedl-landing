wget --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4" -E -H -k -K -p http://www.hopesandfears.com/
for X in lamcdn.net/hopesandfears.com/post-image/*.jpg; do cp $X "${X%.jpg}_x2.jpg"; done;
for X in lamcdn.net/hopesandfears.com/post-image/*.png; do cp $X "${X%.jpg}_x2.png"; done;
