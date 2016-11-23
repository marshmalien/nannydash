(function() {
  angular.module('nannyApp', ['ui.router', 'templates', 'angularUtils.directives.dirPagination'])
    .config(["$stateProvider", "$urlRouterProvider", function($stateProvider, $urlRouterProvider) {

      $urlRouterProvider.otherwise('/');

      $stateProvider.state("nanny_dashboard", {
        url: '/',
        component: 'nannyDashboard'
      }).state('newNannyJobs', {
        url: '/new-jobs',
        component: 'newNannyJobsList',
        resolve: {
          newJob: ['nannyAppAPI', function(nannyAppAPI) {
            console.log('app module nanny jobs');
          }]
        }
      }).state('upcomingJobs', {
        url: '/upcoming-jobs',
        component: 'upcomingJobsList'
      }).state('parentDirectory', {
        url: '/parents',
        component: 'parentList'
      }).state('messaging', {
        url: '/messaging',
        component: 'nannyMessages'
      });
    }]);
})();
