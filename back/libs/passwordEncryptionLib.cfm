<!---
	This library contains a collection of UDF's (User Defined Functions) that
	are used for password encryption and validation, using the
	PBKDF2(Password Based Key Derivation Function 2) and the SHA1 algorithm.
	These UDF's are designed for Railo 4.2.
 --->
<CFSCRIPT>
	<!------------------------>
	<!--- ENCRYPT PASSPORT --->
	<!------------------------>
	<!---
		@param password required
		@return a structure with:
			password hash and salt in hexadecimal
	--->
	function encryptPassword(required password){
		HASH_BIT_SIZE = 256;
		PBKDF2_ITERATIONS = 1000;

		pwCharArray = createObject('java', 'java.lang.String').init(password).toCharArray();

		//create the salt - it has to be a random number that can not be predicted
		salt = getByteArray(32);
		randomObject = createObject('java','java.security.SecureRandom');
		randomObject.nextBytes(salt);

		//hash the password using the salt, the given number of iterations and size
		PBEKeySpec = createObject('java', 'javax.crypto.spec.PBEKeySpec').init(pwCharArray, salt, PBKDF2_ITERATIONS, HASH_BIT_SIZE);
		SecretKeyFactory = createObject('java','javax.crypto.SecretKeyFactory').getInstance("PBKDF2WithHmacSHA1");
		passHash = SecretKeyFactory.generateSecret(PBEKeySpec).getEncoded();

		//convert the password hash and the salt to hexadecimal
		pwHex = binaryEncode(passHash, "hex");
		saltHex = binaryEncode(salt, "hex");

		passHashAndSalt = {
			password = pwHex,
			salt = saltHex
		};

		return passHashAndSalt;
	}

	<!------------------------->
	<!--- VALIDATE PASSPORT --->
	<!------------------------->
	<!---
		@param password required
		@param salt required
		@param passwordHash required
		@return a boolean:
			true if the password with the given salt matches the given hash
	--->
	function validatePassword(required password, required saltHex, required passwordHex){
		HASH_BIT_SIZE = 256;
		PBKDF2_ITERATIONS = 1000;

		pwCharArray = createObject('java', 'java.lang.String').init(password).toCharArray();

		//get the salt - convert it to a bynary object
		salt = BinaryDecode(saltHex, "hex");

		//hash the password using the salt, the given number of iterations and size
		PBEKeySpec = createObject('java', 'javax.crypto.spec.PBEKeySpec').init(pwCharArray, salt, PBKDF2_ITERATIONS, HASH_BIT_SIZE);
		SecretKeyFactory = createObject('java','javax.crypto.SecretKeyFactory').getInstance("PBKDF2WithHmacSHA1");
		passHash = SecretKeyFactory.generateSecret(PBEKeySpec).getEncoded();

		//convert the password hash to hexadecimal
		pwHex = binaryEncode(passHash, "hex");

		return (passwordHex == pwHex);
	}

	<!--------------------------->
	<!--- AUXILIARY FUNCTIONS --->
	<!--------------------------->
	<!--------------------------->
	<!----- Get Byte Array ------>
	<!--------------------------->
	<!---
		@param size required
		@return empty byte Array
	--->
	private function getByteArray(required size){
		emptyByteArray = createObject("java", "java.io.ByteArrayOutputStream").init().toByteArray();
		byteClass = emptyByteArray.getClass().getComponentType();
		byteArray = createObject("java","java.lang.reflect.Array").newInstance(byteClass, ARGUMENTS.size);

		return byteArray;
	}
</CFSCRIPT>