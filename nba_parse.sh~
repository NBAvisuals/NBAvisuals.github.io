distance scored

wget -qO - "http://scores.espn.go.com/nba/playbyplay?gameId=400579089&period=0" |
grep makes |
 sed 's/<tr.*center;">//g' |
 sed 's/<\/td>.*<B>/ /g' |
 sed 's/<\/B><\/td><\/tr>/ Team2/g' |
 sed 's/<\/B>.*<\/tr>/ Team1/g' |
 sed 's/ .*makes//g' |
 sed 's/<thead>//g' |
sed 's/free.*Team/15 1 Team/g' |
sed 's/-foot.*three.*Team/ 3 Team/g' |
 sed 's/-foot.*Team/ 2 Team/g' |
 sed 's/driv.*Team/0 2 Team/g' |
 sed 's/lay.*Team/0 2 Team/g' |
 sed 's/two.*Team/0 2 Team/g' |
 sed 's/dunk.*Team/0 2 Team/g' |
 sed 's/three.*Team/ 23 3 Team/g' |
 sed 's/:/ /g' |
 awk 'BEGIN{timeold=0;timeadd=0;}{time=720-60*$1-$2; if(timeold>time){timeadd+=720;} print $5 "\t" $4 "\t" time+timeadd "\t" $3; timeold=time;}'|
 grep Team2 |
 cut -f3,4 > tmp2"'


score - worm
wget -qO - "http://scores.espn.go.com/nba/playbyplay?gameId=400579089&period=0" | grep makes | sed 's/<tr.*center;">//g' | sed 's/<\/td.*NOWRAP>/ /' | sed 's/<\/td.*//; s/[:-]/ /g'  | awk 'BEGIN{secold=720}{sec=$1*60+$2; diff=$3-$4; if(sec>secold){if(add>=2160){add+=300;}else{add+=720;}} print 720-sec+add "\t" diff; secold=sec;}'
