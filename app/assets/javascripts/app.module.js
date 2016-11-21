angular.module('app', ['ui.router', 'templates', 'angularUtils.directives.dirPagination'])
    .config(["$stateProvider", "$urlRouterProvider", function($stateProvider, $urlRouterProvider) {

        $urlRouterProvider.otherwise('/');

        $stateProvider.state('dashboard', {
            url: '/',
            controller: 'dashboardController as dashboard',
            templateUrl: 'dashboard.html'
        }).state('jobs', {
            url: '/jobs',
            controller: 'allJobsController as allJobs',
            templateUrl: 'jobs-list.html'
        }).state('jobs-list-details', {
            url: '/jobs-details',
            controller: 'jobDetailsController as jobDetails',
            templateUrl: 'jobs-list-details.html'
        }).state('newJobs', {
            url: '/new-jobs',
            component: 'newJobsList',
            resolve: {
                jobs: ['newJobsAPI', function(newJobsAPI) {
                    return newJobsAPI.list();
                }]
            }
        }).state('newJobInfo', {
            url: '/new-job/info/:jobId',
            component: 'newJobInfo',
            resolve: {
                job: ['newJobsAPI', '$stateParams', function(newJobsAPI, $stateParams) {
                    return newJobsAPI.jobInfo($stateParams.jobId);
                }]
            }
        }).state('babysitters', {
            url: '/babysitters',
            templateUrl: 'babysitter-dashboard.html',
            controller: 'babysitterDirectoryController as babysitters'
        }).state('babysitter-profile', {
            url: '/babysitters/profile/:sitterId',
            params: {
                babysitterParam: null,
                sitterId: null
            },
            templateUrl: 'babysitter-profile.html',
            controller: 'babysitterProfileController as babysitter',
            resolve: {}
        }).state('family', {
            url: '/family',
            component: 'familyList',
            resolve: {
                families: ['familyAPI', function(familyAPI) {
                    return familyAPI.list();
                }]
            }
        }).state('messages', {
            url: '/messages',
            templateUrl: 'messages.html',
            controller: 'messagesController as messages'

        }).state('new-message', {
            url: '/new-message',
            templateUrl: 'message-new.html',
            controller: 'newMessageController as newMessage'

        }).state('familyProfile', {
            url: '/family/profile/:familyId',
            component: 'familyProfile',
            resolve: {
                profile: ['familyAPI', '$stateParams', function(familyAPI, $stateParams) {
                    return familyAPI.profileInfo($stateParams.familyId);
                }]
            }
        }).state('pendingBabysitters', {
            url: '/pending-babysitters',
            component: 'pendingBabysittersList',
            resolve: {
                babysitters: ['pendingBabysittersAPI', function(pendingBabysittersAPI) {
                    return pendingBabysittersAPI.list();
                }]
            }
        }).state('pendingBabysitterInfo', {
            url: '/pending-babysitter/info/:sitterId',
            component: 'pendingBabysitterInfo',
            resolve: {
                info: ['pendingBabysittersAPI', '$stateParams', function(pendingBabysittersAPI, $stateParams) {
                    return pendingBabysittersAPI.pendingInfo($stateParams.sitterId);
                }]
            }
        }).state('pendingParents', {
            url: '/pending-parents',
            component: 'pendingParentsList',
            resolve: {
                parents: ['pendingParentsAPI', function(pendingParentsAPI) {
                    return pendingParentsAPI.list();
                }]
            }
        }).state('pendingParentInfo', {
            url: '/pending-parent/info/:parentId',
            component: 'pendingParentInfo',
            resolve: {
                info: ['pendingParentsAPI', '$stateParams', function(pendingParentsAPI, $stateParams) {
                    return pendingParentsAPI.pendingInfo($stateParams.parentId);
                }]
            }
        });
    }]);
