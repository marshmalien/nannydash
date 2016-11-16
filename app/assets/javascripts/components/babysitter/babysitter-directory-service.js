angular.module('app').service('babysitterDirectoryAPI', ['$http', function($http) {
    this.totalBabysitters = [];

    return {
      list: function() {
        return $http({
          url: "/api/v1/sitters",
          method: "GET"
        });
      },
      userProfile: function(id) {
        return $http({
          url: "/api/v1/sitter/" + id,
          method: "GET"
        });
      },
      updateUser: function(id, data) {
        return $http({
          method: 'PATCH',
          url: "/api/v1/sitter/" + id,
          data: {user: data}
        });
        //return $http.patch("/api/v1/sitter/" + id, { newData: data });
      }
    };
  }]);
