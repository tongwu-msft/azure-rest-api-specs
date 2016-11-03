git add . 
git diff --quiet --exit-code --cached || git commit -m "Rest document updated by CI" && git push -u origin master && echo "Document updated"
