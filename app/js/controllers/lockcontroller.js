angular.module("LockChain",[]).controller("LockController", function($scope){

	$scope.household = initialise();

	function initialise(){
		
		var locations = [];
		locations.push({Id:1, Location:"Front Gate", Description:"Front Gate Lock 0x123456789", Locked:false});
		locations.push({Id:2, Location:"Garage", Description:"Garage Lock 0x123456789", Locked:true});
		locations.push({Id:3, Location:"Front Door", Description:"Front Door Lock 0x123456789", Locked:true});
		locations.push({Id:4, Location:"Bank Door", Description:"Back Lock 0x123456789", Locked:true});
		return locations;
	}


	$scope.lock = function(id){
		$scope.household[id].Locked = true;
		console.log("Change Lock State On " + $scope.household[id].Location + " to " + $scope.household[id].Locked);
	};

	$scope.unlock = function(id){
		$scope.household[id].Locked = false;
		console.log("Change Lock State On " + $scope.household[id].Location + " to " + $scope.household[id].Locked);
	};

	$scope.toggle = function(id){
		$scope.household[id].Locked = !$scope.household[id].Locked;
		console.log("Change Lock State On " + $scope.household[id].Location + " to " + $scope.household[id].Locked);
	};

});