paste-log() {

if [ $# -ne 0 ]; then
	curl -X POST -s -T "$1" http://paste.osmc.io/documents | awk -F '"' '{print "http://paste.osmc.io/"$4}'
else
	tmp=$(tempfile)
	cat > $tmp
	curl -X POST -s -T "$tmp" http://paste.osmc.io/documents | awk -F '"' '{print "http://paste.osmc.io/"$4}'
	rm -f $tmp
fi
}
