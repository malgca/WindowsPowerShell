# Description: Data Mining -- Assignment 03
# Author: Malusi Gcakasi
# Version: 1.0
# Last Modified: Mar 19, 2013 07:16 PM

# Reads file into a six dimensional array structure
function readFileToArray
{
	# Read properties file into simple array to make it easier to process
	$simpleArray = @(cat Properties.csv)
	# Create six dimensional array
	$sixDimArray = New-Object 'Object[,,,,,]' 3,2,6,6,6,6

								for($i = 1; $i -lt $simpleArray.Count; $i++)
							{
								$lineArray = $simpleArray[$i].Split(',')
	# Place data into six dim array
	for($a = 0; $a -lt 3; $a++)
	{
		for($b = 0; $b -lt 2; $b++)
		{
			for($c = 0; $c -lt 6; $c++)
			{
				for($d = 0; $d -lt 6; $d++)
				{
					for($e = 0; $e -lt 6; $e++)
					{
						for($f = 0; $f -lt 6; $f++)
						{
								for($lineArrayIndex = 0; $lineArrayIndex -lt $lineArray.Count - 1; $lineArrayIndex++)
								{
									write-host "$a,$b,$c,$d,$e,$f"
									write-host "$lineArrayIndex"
									$sixDimArray[$a,$b,$c,$d,$e,$f] = $lineArray[$lineArrayIndex]
								}
						}
						break
					}
					break
				}
				break
			}
			break
		}
		break
	}
}
	$sixDimArray[0,0,0,0,0,0]
	$sixDimArray[0,0,0,0,0,1]
	$sixDimArray[0,0,0,0,0,2]
	$sixDimArray[0,0,0,0,0,3]
	$sixDimArray[0,0,0,0,0,4]
}

readFileToArray

