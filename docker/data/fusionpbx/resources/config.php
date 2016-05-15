<?php
/* $Id$ */
/*
	config.php
	Copyright (C) 2008, 2013 Mark J Crane
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright notice,
	   this list of conditions and the following disclaimer.

	2. Redistributions in binary form must reproduce the above copyright
	   notice, this list of conditions and the following disclaimer in the
	   documentation and/or other materials provided with the distribution.

	THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
	INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
	AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
	AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
	OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
	SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
	INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
	CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
	ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
*/

//-----------------------------------------------------
// settings:
//-----------------------------------------------------

	//set the database type
		$db_type = 'pgsql'; //sqlite, mysql, pgsql, others with a manually created PDO connection


	//mysql: database connection information
		//$db_host = '';
		//$db_port = '';
		//$db_name = '';
		//$db_username = '';
		//$db_password = '';

	//pgsql: database connection information
		$db_host = 'postgresql'; //set the host only if the database is not local
		$db_port = '5432';
		$db_name = 'fusionpbx';
		$db_username = 'fusionpbx';
		$db_password = '';

	//show errors
		ini_set('display_errors', '1');
		//error_reporting (E_ALL); // Report everything
		//error_reporting (E_ALL ^ E_NOTICE); // Report everything
		error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING ); //hide notices and warnings
?>
