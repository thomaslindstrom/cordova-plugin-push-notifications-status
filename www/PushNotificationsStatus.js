/**
 * www: PushNotificationsStatus.js
**/

var exec = require('cordova/exec');

exports.getStatus = function (success, error) {
    exec(success, error, 'PushNotificationsStatus', 'getStatus');
};
