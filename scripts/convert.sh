#!/bin/sh
for file in `find pages -type f`;
do
    echo "$file" && \
    cat "$file" | \
    sed -E -e "s/^# (.+)/\1\§\1/" | \
    tr '§' '\n' | \
    sed -E -e '2 s/./=/g' \
           -e "s/^(> .+)/\1/" \
           -e "s/^- (.+)/\1/" \
           -e "s/^\`(.+)\`/    \1/" > tmp.md && \
    mv tmp.md "$file"
done

rm -rf tmp.md
