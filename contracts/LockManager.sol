import "./ContractBase.sol";

contract LockManager is ContractBase{

	mapping(address=>bool) locks;

	event Locked(address deviceAddress, address by);
	event Unlocked(address deviceAddress, address by);

	function LockManager(){

	}

	function register(address deviceAddress, bool locked){
		locks[deviceAddress]=locked;
	}

	function unregister(address deviceAddress){
		locks[deviceAddress]=false;
	}

	function lock(address deviceAddress){
		locks[deviceAddress]=true;
		Locked(deviceAddress, msg.sender);
	}

	function unlock(address deviceAddress){
		locks[deviceAddress]=false;
		Unlocked(deviceAddress, msg.sender);
	}

}