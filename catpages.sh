#!/bin/sh

#Takes the Mathematica html maps and makes one big html document out of them and cleans the folders and files that are not needed
#
#Arguments: Title Files
# First argument is the title of the resulting html document, all following files will be added from <p to </p>


#Clean up
rm -rf HTMLLinks
rm -f HTMLFiles/*.css
rm -f HTMLFiles/*.dtd

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">"
echo "<html xmlns=\"http://www.w3.org/1999/xhtml\">"
echo "<head><title>"
echo "$1"
shift
echo " </title>"
echo "<style>*{background-color:#EEE;margin:0;}.Output{background-color:#FFF;margin: 1em auto;width:1000px;padding: 0 1em;}</style>"
echo "</head>"
echo "<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-62818047-1', 'auto');
  ga('send', 'pageview');

</script><body>"

awk 'BEGIN{body=0; count=0}{
if($1=="<p"){body=1; count+=1;}
if($1=="</p>"){body=0; print;}
if(body==1){
gsub("map_[0-9]*",count)
print}
}' "$@"

echo "</body></html>"
