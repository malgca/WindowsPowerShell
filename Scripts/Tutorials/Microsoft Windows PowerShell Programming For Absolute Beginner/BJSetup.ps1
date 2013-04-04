$key = "PSBlackJack" 		# Name of the registry key to be created
$value = "Credits"		# Name of the registry value to be created
$type = "String"		# Type of data stored in the new registry
				# value
$data = "True"			# Data to be stored in the new registry
				# value

function Create-KeyAndValue {

	New-Item -name $key # Create a new registry key
	New-ItemProperty $key -name $value -type $type -value $data

}

cd hkcu:\

Create-KeyAndValue
