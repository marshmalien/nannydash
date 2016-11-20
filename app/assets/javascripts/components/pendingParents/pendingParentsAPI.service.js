(function() {
  'use strict';

  angular.module('app').factory('pendingParentsAPI', ['$http', function($http) {
    return {

      list: function() {
        return $http.get("/api/v1/families/pending.json").then(function(response) {
          return response.data;
        }, function() {
          alert('Failed');
        });
      },

      pendingInfo: function(id) {
        return $http.get("/api/v1/family/" + id + ".json").then(function(response) {
          return(response.data);
        }, function() {
          alert('Failed');
        });
      },

      toggleApprove: function(id) {
        return $http.patch("/api/v1/family/approved/" + id + ".json");
      }

    };
  }]);
})();
