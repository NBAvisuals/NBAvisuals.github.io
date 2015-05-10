#!/bin/sh

#Takes the Mathematica html maps and makes one big html document out of them and cleans the folders and files that are not needed
#
#Arguments: Title Files
# First argument is the title of the resulting html document, all following files will be added from <p to </p>


#Clean up
rm -rf HTMLLinks
rm -f HTMLFiles/*.css

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1 plus MathML 2.0//EN\" \"HTMLFiles/xhtml-math11-f.dtd\">"
echo "<html xmlns=\"http://www.w3.org/1999/xhtml\">"
echo "<head><title>"
echo "$1"
shift
echo " </title>"
echo "<style>*{background-color:#EEE;}.Output{background-color:#FFF;margin: 1em auto;width:1000px;}</style>"
echo "</head><body>"

awk 'BEGIN{body=0; count=0}{
if($1=="<p"){body=1; count+=1;}
if($1=="</p>"){body=0; print;}
if(body==1){
gsub("map_[0-9]*",count)
print}
}' "$@"

echo "</body></html>"
