--[[ ---------------------------------------------------------------------------

	Handy script to pull down files from a web server
	
	Usage: EXEC get-file "[file]"

	* Specify where your files are as variable "web_root" 

--]] ---------------------------------------------------------------------------
	print( " file: " .. ie.args[1] )

	if ie.args[1] == NIL then
		print( "Please specify a file to download" )
		return( false )
	end
	
-- .............................................................................

	connected_tries = 1
	connected_max_tries = 5

	web_root = "http://192.168.1.245/inspiration-engine/"
	get_file = ie.args[1]

-- .............................................................................

	connected = false
	while connected ~= true do

		if connected_tries == connected_max_tries then
			print( "I'm giving up, good day!" )
			return false
		end

		print( "Am I online? Check " .. connected_tries .. "/" .. connected_max_tries )
		connected_tries = connected_tries + 1

		connected = ie.WIFIconnected()
		delay(1000)
			
	end

-- .............................................................................

	a,b = ie.WIFIget( web_root .. get_file, get_file )
	if a then
		print( "Download of " .. get_file .. " complete" )
	else
		print( "Error downloading " .. get_file .. " (" .. b .. ")" )
	end

-- .............................................................................