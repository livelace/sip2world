
--set the variables
	sounds_dir = "/opt/freeswitch/sounds";
	database_dir = "/opt/freeswitch/db";
	recordings_dir = "/opt/freeswitch/recordings";
	storage_dir = "/opt/freeswitch/storage";
	voicemail_dir = "/opt/freeswitch/storage/voicemail";
	php_dir = "/usr/bin";
	php_bin = "php";
	document_root = "/var/www/html/fusionpbx";

--database information
	database = {}
	database["type"] = "pgsql";
	database["name"] = "fusionpbx";
	database["path"] = "";
	database["system"] = "pgsql://hostaddr=172.17.0.215 port=5432 dbname=fusionpbx user=fusionpbx password= options='' application_name='fusionpbx'";
	database["switch"] = "pgsql://hostaddr=172.17.0.215 port=5432 dbname=freeswitch user=fusionpbx password= options='' application_name='freeswitch'";

--additional info
	domain_count = 1;
	temp_dir = "/tmp";

--include local.lua
	dofile(scripts_dir.."/resources/functions/file_exists.lua");
	if (file_exists("/etc/fusionpbx/local.lua")) then
		dofile("/etc/fusionpbx/local.lua");
	elseif (file_exists("/usr/local/etc/fusionpbx/local.lua")) then
		dofile("/usr/local/etc/fusionpbx/local.lua");
	elseif (file_exists(scripts_dir.."/resources/local.lua")) then
		dofile(scripts_dir.."/resources/local.lua");
	end
