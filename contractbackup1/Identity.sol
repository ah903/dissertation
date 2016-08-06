contract Identity is Disposable{
	
	///////////////////////////////////////////////////////
	// Member Data Types
	///////////////////////////////////////////////////////	
	struct identityAttribute{
		string  key;
		string  value;
		bool    isActive;
	}

	struct identity{
		address identityAddress;
		mapping (string=>unint8) attributeMap;
		identityAttribute[] attributeBundle;
		bool isactive; 
	}

	///////////////////////////////////////////////////////
	// Events
	///////////////////////////////////////////////////////	


	///////////////////////////////////////////////////////
	// Constructor Function
	///////////////////////////////////////////////////////	
	function Identity(){
		identity.identityAddress = msg.sender;
	}

	///////////////////////////////////////////////////////
	// SetAttribute
	///////////////////////////////////////////////////////	
	function setAttribute(string key, string value, bool isActive) returns (bool result){
		
		uint8 index = attributeMap[key];
		if(index >= 0){
			identity.attributeBundle[index].value = value;
			identity.attributeBundle[index].isActive = isActive;		
		}
		else{
			identityAttribute newAttribute = identityAttribute({key: key,value: value, isActive:isActive});
			identity.attributeBundle.push(newAttribute);
			attributeMap[key]=identity.attributeBundle.length()-1;
		}
		return true;
	}

	///////////////////////////////////////////////////////
	// getAttribute
	///////////////////////////////////////////////////////	
	function getAttribute(string key) returns (string result){
		return identityAttributes[key];
	}

	///////////////////////////////////////////////////////
	// activate
	///////////////////////////////////////////////////////	
	function activate() returns (bool result){
		identity.isActive=true;
		return (identity.isActive);
	}

	///////////////////////////////////////////////////////
	// deactivate
	///////////////////////////////////////////////////////	
	function deactivate() returns (bool result){
		identity.isActive=false;
		return (!identity.isActive);
	}
	


}