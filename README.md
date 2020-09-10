# CFWebstore 650
CFWebstore is a Coldfusion eCommerce platform.

#Licensing Type as per link http://www.cfwebstore.com/index.cfm?fuseaction=page.display&page_id=33 09/10/2020

# Current Version CFWebstore650 MVC Technology
Fusebox

# CFWebStore Setup
Upload the directory structure to your web root. 
If you prefer to run it as a separate application only, create a subdirectory and upload the files there. 
Be sure to keep the same directory structure (and file case on Unix). 

# CFWebstore Install File
The 'cfwebstore.pdf' file in the documentation directory will give you complete directions on installing and using the software.
 

#Directories not necessary to upload
Documentation directory (user manual, license, and other informational files)
Database (database files and scripts) 
The update directory (used for version 5 upgrades). 

If using the Access database, upload the file outside your webroot for better security, and if running a version 5 upgrade, upload the update directory, perform the upgrade, and then remove it. 

If you are upgrading from a previous version you'll need to run the appropriate upgrade scripts against your database. You can find the correct script in the /updates folder. 