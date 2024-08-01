
ssh-add -D
ssh-add ~/.ssh/id_the1mills

combined=""
for arg in "${@}"; do
  combined="${combined} ${arg}"
done

trimmed="$(echo "$combined" | xargs)"

if test "${trimmed}" == '' ; then
  trimmed="squash-this-commit";
fi

git add .
git add -A
git commit -am "${trimmed}" || {
  echo "could not create a new commit"
}

git push origin || {
  echo 'Could not push to origin.'
  exit 1;
}