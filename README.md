sh404SEF Sitemap Generator
===============
Short script to generate a sitemap from sh404SEF exported URLs on Linux

### Running

To execute the script, you just have to download the .sh file and give it execution permissions:

`chmod +x sh404SEFsitemap.sh`

Then you just have to use the name of the sh404SEF exported **.txt** file as a parameter:

`./sh404SEFsitemap.sh filename.txt`

The script will let you write the appropriate domain (e.g., domain.com, domain.net, etc.) and choose to use HTTPS or HTTP for the sitemap. This script removes all duplicate entries from the sh404SEF file (if there are indeed duplicates) and formats the generated XML file according to the protocol [available on sitemaps.org](https://www.sitemaps.org/protocol.html).

**Don't** write the domain with http:// or https:// included. 

Note:

You can use subdomains as www  and you have to execute the script on the folder where the **.txt** file exported from sh404SEF is located (or enter the complete path as a parameter).

### Additional info

If you don't know how to get the file with the all internal URLs, you just need to go to the SEF URLs manager and use the button `EXPORT` then click `NEXT` to generate the **.txt** file. Save it to your computer and use the script as explained above.

All exported files have the same pattern `year-month-day_urls_export.txt`.
