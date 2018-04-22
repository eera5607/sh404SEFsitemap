#! /bin/bash
if [ $# -eq 0 ]
then
    echo "No arguments supplied"
    exit 1
elif [[ $1 ]]
then
    EXPORTEDURLS=$1
    echo "Write the complete domain of your website (without http://). You can include any subdomain as www"
    echo "Example: www.domain.com or domain.com."
    read DOMAIN
	if  [ -z "$DOMAIN" ]
	then 
	    echo "You have to write a domain before continuing"
	    exit 2
	else
           echo "Do you want to use HTTPS? (Y/N)"
           read HTTPS
	fi
fi

case $HTTPS in
 Y|yes|y|Yes|YES)
#Keeps only 2nd column from file and stores it on a new file
   cat $EXPORTEDURLS | awk -F, '{print $2}' | tr -d '"' > internal.txt
#Removes the first line from the file
   sed -i '1d' internal.txt
#Removes duplicates from list and creates the XML file with that list
   awk '!a[$0]++' internal.txt > sitemap.xml
   rm internal.txt
#Gives format to the sitemap
   sed -e "s/^/<url><loc>https\:\/\/$DOMAIN\//" -i sitemap.xml
   sed -e 's/$/<\/loc><\/url>/' -i sitemap.xml
   sed -i '1s/^/\<urlset xmlns\=\"http\:\/\/www.sitemaps.org\/schemas\/sitemap\/0.9\"\>\n/' sitemap.xml
   sed -i '1s/^/<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n/' sitemap.xml
   echo "</urlset>" >> sitemap.xml
   echo "Your sitemap.xml file has been generated!"
   exit 3
;;
 N|no|n|No|NO)
   cat $EXPORTEDURLS | awk -F, '{print $2}' | tr -d '"' > internal.txt
   sed -i '1d' internal.txt
   awk '!a[$0]++' internal.txt > sitemap.xml
   rm internal.txt
   sed -e "s/^/<url><loc>http\:\/\/$DOMAIN\//" -i sitemap.xml
   sed -e 's/$/<\/loc><\/url>/' -i sitemap.xml
   sed -i '1s/^/\<urlset xmlns\=\"http\:\/\/www.sitemaps.org\/schemas\/sitemap\/0.9\"\>\n/' sitemap.xml
   sed -i '1s/^/<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n/' sitemap.xml
   echo "</urlset>" >> sitemap.xml
   echo "Your sitemap.xml file has been generated!"
   exit 4
;;
*) 
   echo "Please use 'Y' to for HTTPS or 'N' for HTTP"
   exit 5
;;
esac
