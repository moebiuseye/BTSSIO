#!/usr/bin/env bash
#
#  Copyright 2014 Samir Chaouki <moebius.eye@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

exec > "$1/btssio.opml.xml"

cat << EOF
<?xml version="1.0" encoding="utf-8"?>
<opml version="1.0">
  <head>
    <dateCreated>Wed, 22 Oct 2014 19:03:23 +0000</dateCreated>
    <title>Tiny Tiny RSS Feed Export</title>
  </head>
  <body>
EOF

SRC_DIR="$(dirname "$0")"

source "${SRC_DIR}/.skfrc"

cd "$1"
echo "<outline text=\"${title} - ${subtitle}\">"

readarray -t RSSFILES < <(find -name 'rss.xml')


for k in "${!RSSFILES[@]}"
do
    DIRNAME="$(dirname "${RSSFILES[$k]#\./}")"
    SKFRC="${SRC_DIR}/${DIRNAME}/.skfrc"
    [[ -f $SKFRC ]] && source "$SKFRC" > /dev/null
    cat - << EOF
    <outline type="rss" text="${title} -- ${subtitle}" xmlUrl="${base_url}${DIRNAME}/rss.xml" htmlUrl="${base_url}${DIRNAME}/index.html"/>
EOF
done

echo "</outline>"
echo "</body>"
echo "</opml>"

exit 0
