(function() {
  'use strict';

  angular.module('app').factory('pendingParentsAPI', ['$http', function($http) {
    return {

      list: function() {
        return $http.get("/api/v1/families/pending.json").then(function(response) {
          console.log(response.data);
          return response.data;
        }, function() {
          alert('Failed');
        });
      },

      pendingInfo: function(id) {
        return $http.get("/api/v1/family/" + id + ".json").then(function(response) {
          console.log(response.data);
          return(response.data);
        }, function() {
          alert('Failed');
        });
      }

    };
  }]);
})();
