read -p "Alle Änderungen werden verworfen. Weiter? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	git stash
	echo "Änderungen wurden gestasht."
else
	echo "Änderungen wurden beibehalten."
fi
read -n 1 -s -r -p "Beliebige taste Drücken ..."
