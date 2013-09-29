
app = angular.module 'test_angular_animation', ['ngAnimate']

app.controller 'mycontroller', ($scope,$timeout)->

	$scope.things = []

	$scope.target_list_size = 12
	$scope.cycles_per_second = 3

	tick = ->
		n = $scope.things.length
		probability_of_adding = 1 - n / ( $scope.target_list_size * 2 )

		r = Math.random()
		if r < probability_of_adding

			# add a new element
			newthing  = new Array( Math.floor(r * 100) ).join("-");
			newthing += String(r).substr(2,5)
			$scope.things.push newthing
		else	

			# remove a random element
			i = Math.floor(Math.random()*$scope.things.length)			
			$scope.things.splice(i,1)

		$scope.things.sort()
		$timeout tick, (1000 / $scope.cycles_per_second)

	tick()
